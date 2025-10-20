import React from 'react';
import { useCreativeScrollContext } from '@/contexts/CreativeScrollContext';

interface ScrollIndicatorProps {
  sections: { id: string; title: string; description: string }[];
}

const ScrollIndicator: React.FC<ScrollIndicatorProps> = ({ sections }) => {
  const { currentSection, scrollToSection, scrollProgress } = useCreativeScrollContext();

  return (
    <div className="fixed right-8 top-1/2 transform -translate-y-1/2 z-50 flex flex-col items-center space-y-4">
      <div className="text-xs uppercase tracking-widest text-muted-foreground mb-4 rotate-90 origin-center">
        Navigation
      </div>
      <div className="space-y-4">
        {sections.map((_, index) => (
          <button
            key={index}
            onClick={() => scrollToSection(index)}
            className={`block w-3 h-3 rounded-full transition-all duration-500 ${
              index === currentSection 
                ? 'bg-primary scale-125' 
                : 'bg-muted hover:bg-primary/50'
            }`}
            aria-label={`Go to section ${index + 1}`}
          />
        ))}
      </div>
      <div className="w-1 h-32 bg-muted rounded-full overflow-hidden">
        <div 
          className="w-full bg-primary rounded-full transition-all duration-300 ease-out"
          style={{ height: `${scrollProgress * 100}%` }}
        />
      </div>
    </div>
  );
};

export default ScrollIndicator;