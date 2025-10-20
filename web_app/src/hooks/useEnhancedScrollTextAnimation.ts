import { useEffect } from 'react';

// Enhanced scroll text animation that reacts to scroll position
const useEnhancedScrollTextAnimation = () => {
  useEffect(() => {
    let ticking = false;
    
    const updateTextAnimations = () => {
      // Get all elements with data-scroll-effect attribute
      const animatedElements = document.querySelectorAll('[data-scroll-effect]');
      
      animatedElements.forEach(element => {
        const rect = element.getBoundingClientRect();
        const windowHeight = window.innerHeight;
        const elementTop = rect.top;
        const elementBottom = rect.bottom;
        
        // Calculate visibility percentage
        let visibilityPercentage = 0;
        if (elementTop < windowHeight && elementBottom > 0) {
          if (elementTop < 0) {
            // Element is partially scrolled into view from top
            visibilityPercentage = (windowHeight - elementTop) / (rect.height + windowHeight);
          } else {
            // Element is being scrolled down to
            visibilityPercentage = (windowHeight - elementTop) / windowHeight;
          }
        }
        
        // Apply different animation effects based on scroll position
        const effectType = element.getAttribute('data-scroll-effect');
        const progress = Math.min(1, Math.max(0, visibilityPercentage));
        
        // Apply different effects based on type
        switch (effectType) {
          case 'fade':
            (element as HTMLElement).style.opacity = progress.toString();
            break;
          case 'slide-up':
            const translateY = Math.max(0, 50 * (1 - progress));
            (element as HTMLElement).style.transform = `translateY(${translateY}px)`;
            (element as HTMLElement).style.opacity = progress.toString();
            break;
          case 'scale':
            const scaleValue = 0.8 + (0.2 * progress);
            (element as HTMLElement).style.transform = `scale(${scaleValue})`;
            (element as HTMLElement).style.opacity = progress.toString();
            break;
          case 'color-shift':
            // Example: shifts color based on visibility
            const hue = 270 + (30 * (1 - progress)); // shifts from purple to pink
            (element as HTMLElement).style.color = `hsl(${hue} 60% 65%)`;
            break;
          case 'blur':
            const blurValue = 4 * (1 - progress);
            (element as HTMLElement).style.filter = `blur(${blurValue}px)`;
            (element as HTMLElement).style.opacity = progress.toString();
            break;
        }
      });
      
      ticking = false;
    };
    
    const requestTick = () => {
      if (!ticking) {
        requestAnimationFrame(updateTextAnimations);
        ticking = true;
      }
    };
    
    // Add scroll event listener
    window.addEventListener('scroll', requestTick);
    
    // Initial call to set up animations
    updateTextAnimations();
    
    // Cleanup
    return () => {
      window.removeEventListener('scroll', requestTick);
    };
  }, []);
};

export default useEnhancedScrollTextAnimation;