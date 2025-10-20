import { Button } from "@/components/ui/button";
import { ArrowRight } from "lucide-react";
import visiteHero from "@/assets/visite-hero.jpg";
import { useCreativeScrollContext } from "@/contexts/CreativeScrollContext";

const VisiteHero = () => {
  const { scrollToSection } = useCreativeScrollContext();
  const sections = [
    { id: "visite", title: "Visite", description: "Journey to new frontiers, journey to Noto Nature Park" },
    { id: "tranquility", title: "Tranquility", description: "Experience the peaceful moments in nature" },
    { id: "biodiversity", title: "Biodiversity", description: "Discover the rich habitat of Noto" }
  ];

  const handleScrollToNext = () => {
    const currentIndex = sections.findIndex(section => section.id === "visite");
    if (currentIndex < sections.length - 1) {
      scrollToSection(currentIndex + 1);
    }
  };

  return (
    <section id="visite" className="relative min-h-screen flex items-center overflow-hidden snap-start">
      {/* Background Image */}
      <div 
        className="absolute inset-0 bg-cover bg-center bg-no-repeat"
        style={{ backgroundImage: `url(${visiteHero})` }}
      >
        <div className="absolute inset-0 bg-gradient-to-b from-background/30 via-background/50 to-background/80"></div>
      </div>
      
      {/* Content */}
      <div className="container mx-auto px-6 py-32 relative z-10">
        <div className="max-w-3xl">
          <p 
            data-scroll-id="visite-subtitle"
            className="text-muted-foreground text-sm mb-8 tracking-wider uppercase flex items-center gap-3"
          >
            <span className="w-8 h-px bg-muted-foreground"></span>
            <span 
              data-scroll-effect="slide-up"
              className="inline-block transition-all duration-700 ease-out"
            >
              Journey to new frontiers, journey to 
            </span>
            <span 
              data-scroll-effect="slide-up"
              className="inline-block transition-all duration-700 ease-out delay-100"
            >
              Noto Nature Park
            </span>
          </p>
          
          <h1 
            data-scroll-id="visite-title"
            className="text-[10rem] md:text-[12rem] font-light mb-8 leading-none tracking-tighter transition-all duration-700 ease-out"
          >
            {`VISITE`.split('').map((char, index) => (
              <span 
                key={`visite-title-${index}`}
                data-scroll-effect="fade"
                className="inline-block transition-all duration-500 ease-out"
                style={{ 
                  animationDelay: `${index * 50}ms`,
                }}
              >
                {char}
              </span>
            ))}
          </h1>
          
          <p 
            data-scroll-id="visite-description"
            className="text-foreground/80 text-lg mb-12 leading-relaxed max-w-xl transition-all duration-700 ease-out whitespace-pre-wrap"
          >
            {`Away from the manic energy of Japan's `.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`desc1-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${wordIndex * 50}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
            {`famous metropoles lies the `.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`desc2-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${(5 + wordIndex) * 50}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
            {`ancient hamlet of Noto. `.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`desc3-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${(10 + wordIndex) * 50}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
            <br />
            {`Surprising and captivating in equal measure. `.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`desc4-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${(15 + wordIndex) * 50}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
            {`Noto is a region like no other. `.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`desc5-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${(25 + wordIndex) * 50}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
            {`Soaring peaks, lakes and endless waterfalls.`.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`desc6-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${(35 + wordIndex) * 50}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
          </p>
          
          <Button 
            data-scroll-id="visite-button"
            onClick={handleScrollToNext}
            className="bg-foreground text-background hover:bg-foreground/90 transition-all duration-300 group"
            size="lg"
          >
            Start the journey
            <ArrowRight className="ml-2 h-5 w-5 group-hover:translate-x-1 transition-transform" />
          </Button>
        </div>
      </div>
      
      {/* Creative transition overlay */}
      <div className="absolute bottom-0 left-0 right-0 h-32 bg-gradient-to-t from-background to-transparent pointer-events-none"></div>
    </section>
  );
};

export default VisiteHero;
