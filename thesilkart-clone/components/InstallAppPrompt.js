'use client';

import { useEffect, useState } from 'react';
import Image from 'next/image';
import { Download, Share2, X } from 'lucide-react';
import { trackEvent } from '@/lib/analytics-client';
import styles from './InstallAppPrompt.module.css';

function isStandalone() {
  return window.matchMedia?.('(display-mode: standalone)').matches || window.navigator.standalone === true;
}

function installHelp() {
  const agent = window.navigator.userAgent.toLowerCase();
  if (/iphone|ipad|ipod/.test(agent)) return 'Tap Share, then choose Add to Home Screen.';
  return 'Open your browser menu and choose Install app or Add to Home screen.';
}

export default function InstallAppPrompt() {
  const [installEvent, setInstallEvent] = useState(null);
  const [expanded, setExpanded] = useState(false);
  const [helpText, setHelpText] = useState('');
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    if (isStandalone()) return undefined;
    const revealTimer = window.setTimeout(() => setVisible(true), 900);

    function onBeforeInstallPrompt(event) {
      event.preventDefault();
      setInstallEvent(event);
      setVisible(true);
    }

    function onInstalled() {
      trackEvent('pwa_installed');
      setVisible(false);
    }

    window.addEventListener('beforeinstallprompt', onBeforeInstallPrompt);
    window.addEventListener('appinstalled', onInstalled);
    return () => {
      window.clearTimeout(revealTimer);
      window.removeEventListener('beforeinstallprompt', onBeforeInstallPrompt);
      window.removeEventListener('appinstalled', onInstalled);
    };
  }, []);

  async function installApp() {
    if (!installEvent) {
      setHelpText(installHelp());
      setExpanded(true);
      trackEvent('pwa_install_help_opened');
      return;
    }
    installEvent.prompt();
    const choice = await installEvent.userChoice.catch(() => null);
    trackEvent('pwa_install_prompt', { outcome: choice?.outcome || 'unknown' });
    setInstallEvent(null);
    if (choice?.outcome === 'accepted') setVisible(false);
  }

  if (!visible) return null;

  if (!expanded) {
    return <button className={styles.floatingInstall} type="button" onClick={installApp} aria-label="Install Bangle by Choice app"><Download aria-hidden="true" /><span>Install app</span></button>;
  }

  return (
    <aside className={styles.prompt} aria-label="Install Bangle by Choice app" aria-live="polite">
      <button className={styles.close} type="button" onClick={() => setExpanded(false)} aria-label="Close install instructions"><X aria-hidden="true" /></button>
      <div className={styles.icon}><Image src="/icons/icon-96.png" alt="" width={42} height={42} /></div>
      <div>
        <b>Install Bangle by Choice</b>
        <span>{helpText}</span>
      </div>
      <button className={styles.install} type="button" onClick={() => setExpanded(false)}><Share2 aria-hidden="true" /> Got it</button>
    </aside>
  );
}
