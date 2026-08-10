'use client';

import { useEffect, useState } from 'react';
import Image from 'next/image';
import { Download, Share2, X } from 'lucide-react';
import { trackEvent } from '@/lib/analytics-client';
import styles from './InstallAppPrompt.module.css';

function isStandalone() {
  return window.matchMedia?.('(display-mode: standalone)').matches || window.navigator.standalone === true;
}

function isIosSafari() {
  const agent = window.navigator.userAgent.toLowerCase();
  return /iphone|ipad|ipod/.test(agent) && /safari/.test(agent) && !/crios|fxios|edgios/.test(agent);
}

export default function InstallAppPrompt() {
  const [installEvent, setInstallEvent] = useState(null);
  const [showIosHelp, setShowIosHelp] = useState(false);
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    if (isStandalone() || localStorage.getItem('bbc_install_prompt_dismissed') === '1') return undefined;
    const iosTimer = isIosSafari() ? window.setTimeout(() => setVisible(true), 900) : null;

    function onBeforeInstallPrompt(event) {
      event.preventDefault();
      setInstallEvent(event);
      setVisible(true);
    }

    function onInstalled() {
      trackEvent('pwa_installed');
      setVisible(false);
      localStorage.setItem('bbc_install_prompt_dismissed', '1');
    }

    window.addEventListener('beforeinstallprompt', onBeforeInstallPrompt);
    window.addEventListener('appinstalled', onInstalled);
    return () => {
      if (iosTimer) window.clearTimeout(iosTimer);
      window.removeEventListener('beforeinstallprompt', onBeforeInstallPrompt);
      window.removeEventListener('appinstalled', onInstalled);
    };
  }, []);

  async function installApp() {
    if (!installEvent) {
      setShowIosHelp(true);
      trackEvent('pwa_install_ios_help');
      return;
    }
    installEvent.prompt();
    const choice = await installEvent.userChoice.catch(() => null);
    trackEvent('pwa_install_prompt', { outcome: choice?.outcome || 'unknown' });
    setInstallEvent(null);
    if (choice?.outcome === 'accepted') setVisible(false);
  }

  function dismiss() {
    localStorage.setItem('bbc_install_prompt_dismissed', '1');
    setVisible(false);
  }

  if (!visible) return null;

  return (
    <aside className={styles.prompt} aria-label="Install Bangle by Choice app">
      <button className={styles.close} type="button" onClick={dismiss} aria-label="Hide install app prompt"><X aria-hidden="true" /></button>
      <div className={styles.icon}><Image src="/icons/icon-96.png" alt="" width={42} height={42} /></div>
      <div>
        <b>Install Bangle by Choice</b>
        <span>{showIosHelp ? 'Tap Share, then Add to Home Screen.' : 'Shop faster from your home screen.'}</span>
      </div>
      <button className={styles.install} type="button" onClick={installApp}>{showIosHelp ? <Share2 aria-hidden="true" /> : <Download aria-hidden="true" />} Install</button>
    </aside>
  );
}
