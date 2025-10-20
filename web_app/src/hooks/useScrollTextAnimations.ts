import { useEffect } from 'react';

// React hook to handle scroll-triggered text animations
const useScrollTextAnimations = () => {
  useEffect(() => {
    // Options for the intersection observer
    const options = {
      root: null,
      rootMargin: '0px',
      threshold: 0.1 // Trigger when 10% of the element is visible
    };

    // Main observer for elements with data-scroll-id
    const mainObserver = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        const element = entry.target as HTMLElement;
        const isVisible = entry.isIntersecting;
        
        if (isVisible) {
          // Add visible state to the element
          element.setAttribute('data-visible', 'true');
          
          // Process elements with data-scroll-effect attribute inside this element
          const effectElements = element.querySelectorAll('[data-scroll-effect]');
          effectElements.forEach((effectEl: Element, index) => {
            const effectElement = effectEl as HTMLElement;
            // Apply staggered animation to each character/element
            setTimeout(() => {
              effectElement.style.opacity = '1';
              effectElement.style.transform = 'translateY(0) scale(1)';
            }, index * 30); // Add delay based on position in text
          });
        } else {
          element.setAttribute('data-visible', 'false');
        }
      });
    }, options);

    // Observer for elements with data-scroll-effect directly (top-level)
    const directObserver = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        const element = entry.target as HTMLElement;
        const isVisible = entry.isIntersecting;
        
        if (isVisible) {
          // Apply animation to directly observed element
          element.style.opacity = '1';
          element.style.transform = 'translateY(0) scale(1)';
          element.setAttribute('data-visible', 'true');
        }
      });
    }, options);

    // Observe elements with data-scroll-id
    document.querySelectorAll('[data-scroll-id]').forEach(element => {
      mainObserver.observe(element);
    });

    // Observe elements with data-scroll-effect directly (not inside data-scroll-id)
    document.querySelectorAll('[data-scroll-effect]:not([data-scroll-id] [data-scroll-effect])').forEach(element => {
      directObserver.observe(element);
    });

    // Cleanup function
    return () => {
      mainObserver.disconnect();
      directObserver.disconnect();
    };
  }, []); // Empty dependency array means this runs once on mount
};

export default useScrollTextAnimations;