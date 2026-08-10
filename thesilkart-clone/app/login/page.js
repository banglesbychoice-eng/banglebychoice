import { redirect } from 'next/navigation';

export const metadata = {
  title: 'Login',
  robots: { index: false, follow: true },
};

export default function LoginPage() {
  redirect('/account');
}
