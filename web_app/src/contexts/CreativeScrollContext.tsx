import React, { createContext, useContext } from 'react';
import useEnhancedCreativeScroll from '@/hooks/useEnhancedCreativeScroll';
import useScrollTextAnimations from '@/hooks/useScrollTextAnimations';

interface ScrollSection {
  id: string;
  title: string;
  description: string;
}

interface CreativeScrollContextType {
  currentSection: number;
  scrollProgress: number;
  isScrolling: boolean;
  scrollToSection: (index: number) => void;
  scrollToNext: () => void;
  scrollToPrev: () => void;
}

const CreativeScrollContext = createContext<CreativeScrollContextType | undefined>(undefined);

export const CreativeScrollProvider: React.FC<{ 
  children: React.ReactNode,
  sections: ScrollSection[]
}> = ({ children, sections }) => {
  const scrollHook = useEnhancedCreativeScroll(sections);
  useScrollTextAnimations(); // Initialize scroll text animations

  return (
    <CreativeScrollContext.Provider value={scrollHook}>
      {children}
    </CreativeScrollContext.Provider>
  );
};

export const useCreativeScrollContext = () => {
  const context = useContext(CreativeScrollContext);
  if (context === undefined) {
    throw new Error('useCreativeScrollContext must be used within a CreativeScrollProvider');
  }
  return context;
};