import { useState, useEffect } from 'react';

interface ScrollSection {
  id: string;
  title: string;
  description: string;
}

const useCreativeScroll = (sections: ScrollSection[]) => {
  const [currentSection, setCurrentSection] = useState(0);
  const [scrollProgress, setScrollProgress] = useState(0);
  const [isScrolling, setIsScrolling] = useState(false);

  // Handle scroll events for progress tracking
  useEffect(() => {
    const handleScroll = () => {
      if (isScrolling) return; // Skip during manual scroll

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

  // Function to handle creative scrolling to a section
  const scrollToSection = (index: number) => {
    setIsScrolling(true);
    const element = document.getElementById(sections[index].id);
    
    if (element) {
      // Add animation class to body for transition effect
      document.body.classList.add('scroll-transition');
      
      // Add a special class to indicate active scroll
      document.documentElement.classList.add('is-scrolling');
      
      // Scroll to the section
      element.scrollIntoView({ 
        behavior: 'smooth',
        block: 'start'
      });

      // Update current section after a delay
      setTimeout(() => {
        setCurrentSection(index);
        setIsScrolling(false);
        
        // Remove animation classes after scroll completes
        document.body.classList.remove('scroll-transition');
        document.documentElement.classList.remove('is-scrolling');
      }, 1000); // Match the duration of the scroll animation
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

export default useCreativeScroll;