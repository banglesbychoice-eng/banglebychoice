import { siteUrl } from '@/lib/seo';

export default function robots() {
  const disallow = ['/admin', '/api/', '/checkout', '/wishlist'];
  const supportedBots = ['OAI-SearchBot', 'GPTBot', 'ChatGPT-User', 'PerplexityBot', 'ClaudeBot', 'anthropic-ai', 'Google-Extended'];
  return { rules: [
    { userAgent: '*', allow: '/', disallow },
    ...supportedBots.map((userAgent) => ({ userAgent, allow: '/', disallow })),
  ], sitemap: `${siteUrl}/sitemap.xml`, host: siteUrl };
}
