'use client';

import { useRef, useState } from 'react';
import { Mic, MicOff } from 'lucide-react';

function getRecognition() {
  if (typeof window === 'undefined') return null;
  return window.SpeechRecognition || window.webkitSpeechRecognition || null;
}

export default function VoiceSearchButton({ onTranscript, onFinal, className = '', label = 'Mic' }) {
  const [listening, setListening] = useState(false);
  const [supported, setSupported] = useState(true);
  const recognitionRef = useRef(null);

  function startVoiceSearch() {
    const Recognition = getRecognition();
    if (!Recognition) {
      setSupported(false);
      return;
    }

    recognitionRef.current?.abort?.();
    const recognition = new Recognition();
    recognitionRef.current = recognition;
    recognition.lang = 'en-IN';
    recognition.interimResults = true;
    recognition.continuous = false;
    recognition.maxAlternatives = 3;

    recognition.onstart = () => setListening(true);
    recognition.onerror = () => setListening(false);
    recognition.onend = () => setListening(false);
    recognition.onresult = (event) => {
      const transcript = [...event.results].map((result) => result[0]?.transcript || '').join(' ').trim();
      if (!transcript) return;
      onTranscript(transcript);
      const lastResult = event.results[event.results.length - 1];
      if (lastResult?.isFinal) onFinal?.(transcript);
    };

    recognition.start();
  }

  return (
    <button type="button" className={className} onClick={startVoiceSearch} aria-label={listening ? 'Listening for voice search' : 'Search by voice'} title={supported ? 'Search by voice' : 'Voice search is not supported on this browser'}>
      {supported ? <><Mic aria-hidden="true" />{listening ? <i aria-hidden="true" /> : null}{label || listening ? <b>{listening ? 'Listening' : label}</b> : null}</> : <><MicOff aria-hidden="true" /><b>Unavailable</b></>}
    </button>
  );
}
