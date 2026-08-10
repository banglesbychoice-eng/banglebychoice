'use client';

import { useFormStatus } from 'react-dom';

export default function PendingSubmitButton({ children, pendingLabel = 'Updating…' }) {
  const { pending } = useFormStatus();
  return <button type="submit" disabled={pending} aria-busy={pending}>{pending ? pendingLabel : children}</button>;
}
