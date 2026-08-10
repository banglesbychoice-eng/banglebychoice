'use client';

import { useRef, useState } from 'react';
import VoiceSearchButton from '@/components/VoiceSearchButton';
import PendingSubmitButton from '@/components/PendingSubmitButton';
import styles from './search.module.css';

export default function SearchForm({ query, children }) {
  const [value, setValue] = useState(query);
  const formRef = useRef(null);

  function submitTranscript(transcript) {
    setValue(transcript);
    const input = formRef.current?.elements?.q;
    if (input) input.value = transcript;
    requestAnimationFrame(() => formRef.current?.requestSubmit());
  }

  return (
    <form ref={formRef} action="/search">
      <div className={styles.searchInputRow}>
        <input name="q" value={value} onChange={(event) => setValue(event.target.value)} placeholder="Try 6K eye, 3mm round, glossy white or silk thread" autoFocus />
        <VoiceSearchButton className={styles.voiceButton} onTranscript={setValue} onFinal={submitTranscript} label="Mic" />
        <PendingSubmitButton pendingLabel="Searching…">Search</PendingSubmitButton>
      </div>
      {children}
    </form>
  );
}
