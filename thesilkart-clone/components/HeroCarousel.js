'use client';

import Image from 'next/image';
import Link from 'next/link';
import { ChevronLeft, ChevronRight, Pause, Play } from 'lucide-react';
import { useEffect, useRef, useState } from 'react';
import styles from './HeroCarousel.module.css';

const slides = [
  {
    image: '/images/generated/banglebychoice-hero.webp',
    alt: 'Premium kundan stones, silk threads and handcrafted bangles arranged for jewellery making',
    eyebrow: 'Materials chosen for makers',
    title: 'Your next beautiful piece starts here.',
    copy: 'Premium kundan stones, silk threads and jewellery-making essentials for ideas worth bringing to life.',
    cta: 'Explore kundan stones',
    href: '/collections/kundan-stones',
    position: 'center',
  },
  {
    image: '/images/generated/banglebychoice-artisan-hero.webp',
    alt: 'An artisan handcrafting a burgundy silk-thread bangle with kundan stones',
    eyebrow: 'Made by your hands',
    title: 'Create something they will always remember.',
    copy: 'From the first wrap of thread to the final stone, find every detail that makes your work feel personal.',
    cta: 'Shop bangle materials',
    href: '/collections/silk-thread-materials',
    position: 'center',
  },
  {
    image: '/images/generated/banglebychoice-celebration-hero.webp',
    alt: 'Finished handcrafted burgundy kundan bangles presented as a meaningful festive gift',
    eyebrow: 'For moments worth making',
    title: 'Turn every celebration into something personal.',
    copy: 'Choose premium stones, charms and finishing details for gifts and designs that carry your signature.',
    cta: 'Discover accessories',
    href: '/collections/jewellery-making',
    position: 'center',
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
      aria-label="Featured collections"
      aria-roledescription="carousel"
      onMouseEnter={() => setInteractionPaused(true)}
      onMouseLeave={() => setInteractionPaused(false)}
      onFocusCapture={() => setInteractionPaused(true)}
      onBlurCapture={(event) => { if (!event.currentTarget.contains(event.relatedTarget)) setInteractionPaused(false); }}
      onTouchStart={(event) => { touchStart.current = event.touches[0].clientX; }}
      onTouchEnd={finishSwipe}
    >
      <div className={styles.backdrop} key={slide.image}>
        <Image
          src={slide.image}
          alt={slide.alt}
          fill
          priority={activeSlide === 0}
          fetchPriority={activeSlide === 0 ? 'high' : 'auto'}
          sizes="100vw"
          quality={75}
          className={styles.image}
          style={{ objectPosition: slide.position }}
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
