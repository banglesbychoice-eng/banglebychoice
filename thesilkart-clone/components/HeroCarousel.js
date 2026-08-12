'use client';

import Image from 'next/image';
import Link from 'next/link';
import { ChevronLeft, ChevronRight, Pause, Play } from 'lucide-react';
import { useEffect, useRef, useState } from 'react';
import styles from './HeroCarousel.module.css';

const slides = [
  {
    image: '/images/generated/banglebychoice-hero.webp',
    alt: 'Silk threads, Kundan stones, tools and handcrafted thread bangles arranged for bangle making',
    eyebrow: 'For silk-thread bangle makers',
    title: 'Beautiful bangles start with the right materials.',
    copy: 'Choose silk threads, Kundan stones, bangle bases and finishing supplies for your next handmade set.',
    cta: 'Shop bangle materials',
    href: '/collections/raw-materials',
    desktopPosition: 'center center',
    mobilePosition: '78% center',
  },
  {
    image: '/images/generated/banglebychoice-artisan-hero.webp',
    alt: 'An artisan handcrafting a burgundy silk-thread bangle with kundan stones',
    eyebrow: 'Wrap. Decorate. Finish.',
    title: 'Make each thread bangle look unmistakably yours.',
    copy: 'Match thread shades, stones, chain and glue with confidence—from the first wrap to the final detail.',
    cta: 'Shop silk-thread supplies',
    href: '/collections/silk-thread-materials',
    desktopPosition: 'center center',
    mobilePosition: '80% center',
  },
  {
    image: '/images/generated/banglebychoice-celebration-hero.webp',
    alt: 'Finished handcrafted silk-thread Kundan bangles presented as a festive gift',
    eyebrow: 'Made to be remembered',
    title: 'Create festive bangles customers want to keep.',
    copy: 'Build coordinated sets with premium Kundan stones, charms and finishing details selected for bangle makers.',
    cta: 'Explore Kundan stones',
    href: '/collections/kundan-stones',
    desktopPosition: 'center center',
    mobilePosition: '82% center',
  },
];

export default function HeroCarousel() {
  const [activeSlide, setActiveSlide] = useState(0);
  const [interactionPaused, setInteractionPaused] = useState(false);
  const [manualPaused, setManualPaused] = useState(false);
  const [reduceMotion, setReduceMotion] = useState(false);
  const touchStart = useRef(null);
  const slide = slides[activeSlide];

  useEffect(() => {
    const media = window.matchMedia('(prefers-reduced-motion: reduce)');
    const updatePreference = () => setReduceMotion(media.matches);
    updatePreference();
    media.addEventListener('change', updatePreference);
    return () => media.removeEventListener('change', updatePreference);
  }, []);

  useEffect(() => {
    const nextImage = new window.Image();
    nextImage.src = slides[(activeSlide + 1) % slides.length].image;
  }, [activeSlide]);

  useEffect(() => {
    if (interactionPaused || manualPaused || reduceMotion) return undefined;
    const timer = window.setInterval(() => setActiveSlide((current) => (current + 1) % slides.length), 6500);
    return () => window.clearInterval(timer);
  }, [interactionPaused, manualPaused, reduceMotion]);

  function move(direction) {
    setActiveSlide((current) => (current + direction + slides.length) % slides.length);
  }

  function finishSwipe(event) {
    if (touchStart.current === null) return;
    const distance = touchStart.current - event.changedTouches[0].clientX;
    touchStart.current = null;
    if (Math.abs(distance) > 48) move(distance > 0 ? 1 : -1);
  }

  return (
    <section
      className={styles.hero}
      aria-label="Featured materials for silk thread bangle makers"
      aria-roledescription="carousel"
      onMouseEnter={() => setInteractionPaused(true)}
      onMouseLeave={() => setInteractionPaused(false)}
      onFocusCapture={() => setInteractionPaused(true)}
      onBlurCapture={(event) => { if (!event.currentTarget.contains(event.relatedTarget)) setInteractionPaused(false); }}
      onTouchStart={(event) => { touchStart.current = event.touches[0].clientX; }}
      onTouchEnd={finishSwipe}
    >
      <div className={styles.backdrop} key={slide.image} style={{ '--desktop-position': slide.desktopPosition, '--mobile-position': slide.mobilePosition }}>
        <Image
          src={slide.image}
          alt={slide.alt}
          fill
          priority={activeSlide === 0}
          fetchPriority={activeSlide === 0 ? 'high' : 'auto'}
          sizes="100vw"
          quality={75}
          className={styles.image}
        />
      </div>
      <div className={styles.content} key={`${activeSlide}-${slide.title}`} role="group" aria-label={`Slide ${activeSlide + 1} of ${slides.length}`}>
        <p className={styles.eyebrow}>{slide.eyebrow}</p>
        <h1>{slide.title}</h1>
        <p className={styles.copy}>{slide.copy}</p>
        <Link href={slide.href}>{slide.cta}</Link>
      </div>
      <div className={styles.controls}>
        <button type="button" onClick={() => move(-1)} aria-label="Previous featured collection"><ChevronLeft aria-hidden="true" /></button>
        <div className={styles.dots} aria-label="Choose featured collection">
          {slides.map((item, index) => <button type="button" key={item.image} className={index === activeSlide ? styles.activeDot : ''} onClick={() => setActiveSlide(index)} aria-label={`Show slide ${index + 1}: ${item.eyebrow}`} aria-current={index === activeSlide ? 'true' : undefined} />)}
        </div>
        <button type="button" onClick={() => move(1)} aria-label="Next featured collection"><ChevronRight aria-hidden="true" /></button>
        {!reduceMotion ? <button type="button" onClick={() => setManualPaused((current) => !current)} aria-label={manualPaused ? 'Play featured collections' : 'Pause featured collections'}>{manualPaused ? <Play aria-hidden="true" /> : <Pause aria-hidden="true" />}</button> : null}
      </div>
    </section>
  );
}
