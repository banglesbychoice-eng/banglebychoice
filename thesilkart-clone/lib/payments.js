export const upiPayeeAddress = process.env.NEXT_PUBLIC_UPI_ID || '';
export const upiPayeeName = process.env.NEXT_PUBLIC_UPI_NAME || 'Bangle by Choice';

export function isUpiConfigured() {
  return Boolean(upiPayeeAddress);
}

export function buildStaticUpiQrLink() {
  if (!upiPayeeAddress) return '';
  const params = new URLSearchParams({
    pa: upiPayeeAddress.trim(),
    pn: upiPayeeName.trim(),
    cu: 'INR',
  });
  return `upi://pay?${params.toString()}`;
}

export function orderReference() {
  return `BBC-${Date.now().toString(36).toUpperCase()}`;
}

function numericTransactionReference(value) {
  const reference = String(value || orderReference()).toUpperCase();
  let hash = 2166136261;
  for (const character of reference) {
    hash ^= character.charCodeAt(0);
    hash = Math.imul(hash, 16777619) >>> 0;
  }
  const dateDigits = reference.replace(/\D/g, '').slice(0, 12) || Date.now().toString().slice(-12);
  return `${dateDigits}${String(hash).padStart(10, '0')}`.slice(0, 35);
}

export function buildUpiPaymentLink({ amount, note = 'Bangle by Choice order', transactionReference }) {
  const numericAmount = Number(amount);
  if (!upiPayeeAddress || !Number.isFinite(numericAmount) || numericAmount <= 0) return '';
  const params = new URLSearchParams({
    pa: upiPayeeAddress.trim(),
    pn: upiPayeeName.trim(),
    tr: numericTransactionReference(transactionReference || note),
    am: numericAmount.toFixed(2),
    cu: 'INR',
    tn: String(note).trim().slice(0, 50),
  });
  return `upi://pay?${params.toString()}`;
}
