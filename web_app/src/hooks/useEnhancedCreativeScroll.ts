import { useState, useEffect, useRef } from 'react';

interface ScrollSection {
  id: string;
  title: string;
  description: string;
}

const useEnhancedCreativeScroll = (sections: ScrollSection[]) => {
  const [currentSection, setCurrentSection] = useState(0);
  const [scrollProgress, setScrollProgress] = useState(0);
  const [isScrolling, setIsScrolling] = useState(false);
  const isAutoScrolling = useRef(false);
  const scrollTimeout = useRef<NodeJS.Timeout | null>(null);

  // Observer for intersection changes
  useEffect(() => {
    const options = {
      root: null,
      rootMargin: '0px',
      threshold: 0.6 // Trigger when 60% of the section is visible
    };

    const observer = new IntersectionObserver((entries) => {
      if (isAutoScrolling.current) return; // Skip during auto scroll

      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const index = sections.findIndex(section => 
            section.id === entry.target.getAttribute('id')
          );
          
          if (index !== -1) {
            setCurrentSection(index);
          }
        }
      });
    }, options);

    // Observe all sections
    sections.forEach(section => {
      const element = document.getElementById(section.id);
      if (element) {
        observer.observe(element);
      }
    });

    return () => {
      observer.disconnect();
      if (scrollTimeout.current) {
        clearTimeout(scrollTimeout.current);
      }
    };
  }, [sections]);

  // Track scroll progress
  useEffect(() => {
    const handleScroll = () => {
      if (isScrolling || isAutoScrolling.current) return;

      const scrollY = window.scrollY;
      const windowHeight = window.innerHeight;
      const totalHeight = document.documentElement.scrollHeight - windowHeight;
      
      if (totalHeight > 0) {
        const progress = Math.min(1, Math.max(0, scrollY / totalHeight));
        setScrollProgress(progress);
      }
    };

    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, [isScrolling]);

  // Smooth scroll to section with enhanced animations
  const scrollToSection = (index: number) => {
    setIsScrolling(true);
    isAutoScrolling.current = true;
    
    const element = document.getElementById(sections[index].id);
    
    if (element) {
      // Add animation classes for enhanced transition
      document.documentElement.classList.add('is-scrolling');
      document.body.classList.add('scroll-transition');
      
      // Scroll to the section
      element.scrollIntoView({ 
        behavior: 'smooth',
        block: 'start'
      });

      // Update current section after a delay
      if (scrollTimeout.current) {
        clearTimeout(scrollTimeout.current);
      }
      
      scrollTimeout.current = setTimeout(() => {
        setCurrentSection(index);
        setIsScrolling(false);
        
        // Remove animation classes after scroll completes
        document.documentElement.classList.remove('is-scrolling');
        document.body.classList.remove('scroll-transition');
        
        // Reset the auto scrolling flag after a brief delay
        setTimeout(() => {
          isAutoScrolling.current = false;
        }, 300);
      }, 1200); // Slightly longer to match enhanced animations
    }
  };

  // Function to handle scroll to next section
  const scrollToNext = () => {
    if (currentSection < sections.length - 1) {
      scrollToSection(currentSection + 1);
    }
  };

  // Function to handle scroll to previous section
  const scrollToPrev = () => {
    if (currentSection > 0) {
      scrollToSection(currentSection - 1);
    }
  };

  return {
    currentSection,
    scrollProgress,
    isScrolling,
    scrollToSection,
    scrollToNext,
    scrollToPrev
  };
};

export default useEnhancedCreativeScroll;