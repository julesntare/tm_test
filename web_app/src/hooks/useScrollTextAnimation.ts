import { useState, useEffect, useRef } from 'react';

interface ScrollTextAnimation {
  elementId: string;
  animationType: 'fade' | 'slide' | 'scale' | 'rotate' | 'blur';
  triggerPoint?: 'top' | 'middle' | 'bottom';
  offset?: number;
}

const useScrollTextAnimation = (animations: ScrollTextAnimation[]) => {
  const [visibleElements, setVisibleElements] = useState<Set<string>>(new Set());
  const observerRef = useRef<IntersectionObserver | null>(null);

  useEffect(() => {
    // Options for the intersection observer
    const options = {
      root: null,
      rootMargin: '0px',
      threshold: animations.map(() => 0.1) // Trigger when 10% of element is visible
    };

    // Cleanup previous observer
    if (observerRef.current) {
      observerRef.current.disconnect();
    }

    // Create new observer
    observerRef.current = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        const elementId = entry.target.getAttribute('data-scroll-id');
        
        if (entry.isIntersecting && elementId) {
          setVisibleElements(prev => new Set(prev).add(elementId));
        } else if (!entry.isIntersecting && elementId) {
          setVisibleElements(prev => {
            const newSet = new Set(prev);
            newSet.delete(elementId);
            return newSet;
          });
        }
      });
    }, options);

    // Observe all animated elements
    animations.forEach(anim => {
      const element = document.querySelector(`[data-scroll-id="${anim.elementId}"]`);
      if (element && observerRef.current) {
        observerRef.current.observe(element);
      }
    });

    // Cleanup on unmount
    return () => {
      if (observerRef.current) {
        observerRef.current.disconnect();
      }
    };
  }, [animations]);

  // Function to get animation classes based on visibility
  const getAnimationClasses = (elementId: string, animationType: ScrollTextAnimation['animationType']) => {
    const isVisible = visibleElements.has(elementId);
    const baseClass = 'transition-all duration-700 ease-out';

    switch (animationType) {
      case 'fade':
        return `${baseClass} ${isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-4'}`;
      case 'slide':
        return `${baseClass} ${isVisible ? 'opacity-100 translate-x-0' : 'opacity-0 -translate-x-10'}`;
      case 'scale':
        return `${baseClass} ${isVisible ? 'opacity-100 scale-100' : 'opacity-0 scale-90'}`;
      case 'rotate':
        return `${baseClass} ${isVisible ? 'opacity-100 rotate-0' : 'opacity-0 -rotate-12'}`;
      case 'blur':
        return `${baseClass} ${isVisible ? 'opacity-100 blur-0' : 'opacity-100 blur-md'}`;
      default:
        return `${baseClass} ${isVisible ? 'opacity-100' : 'opacity-0'}`;
    }
  };

  return { getAnimationClasses, visibleElements };
};

export default useScrollTextAnimation;