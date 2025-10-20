import heroBackground from "@/assets/hero-background.jpg";
import { useCreativeScrollContext } from "@/contexts/CreativeScrollContext";

const Hero = () => {
  const { scrollToSection } = useCreativeScrollContext();
  const sections = [
    { id: "visite", title: "Visite", description: "Journey to new frontiers, journey to Noto Nature Park" },
    { id: "tranquility", title: "Tranquility", description: "Experience the peaceful moments in nature" },
    { id: "biodiversity", title: "Biodiversity", description: "Discover the rich habitat of Noto" }
  ];

  const handleScrollToPrev = () => {
    const currentIndex = sections.findIndex(section => section.id === "biodiversity");
    if (currentIndex > 0) {
      scrollToSection(currentIndex - 1);
    }
  };

  return (
    <section id="biodiversity" className="relative min-h-screen flex items-center overflow-hidden scroll-mt-20 snap-start">
      {/* Background Image */}
      <div 
        className="absolute inset-0 bg-cover bg-center bg-no-repeat"
        style={{ backgroundImage: `url(${heroBackground})` }}
      >
        <div className="absolute inset-0 bg-gradient-to-b from-background/40 via-background/60 to-background"></div>
      </div>
      
      {/* Content */}
      <div className="container mx-auto px-6 py-32 relative z-10">
        <div className="max-w-2xl">
          <p 
            data-scroll-id="biodiversity-subtitle"
            className="text-muted-foreground text-sm mb-6 tracking-wider uppercase"
          >
            <span 
              data-scroll-effect="slide-up"
              className="inline-block transition-all duration-500 ease-out delay-100"
            >
              03/
            </span>
            <span 
              data-scroll-effect="slide-up"
              className="inline-block transition-all duration-500 ease-out delay-200"
            >
              Habitat
            </span>
          </p>
          
          <h1 
            data-scroll-id="biodiversity-title"
            className="text-7xl md:text-8xl font-light mb-8 leading-none transition-all duration-700 ease-out"
          >
            {`Biodiversity`.split('').map((char, index) => (
              <span 
                key={`bio-title-${index}`}
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
          
          <div 
            className="w-16 h-px bg-primary mb-8 transition-all duration-700 ease-out"
          ></div>
          
          <p 
            data-scroll-id="biodiversity-description"
            className="text-foreground/80 text-lg mb-12 leading-relaxed max-w-xl transition-all duration-700 ease-out whitespace-pre-wrap"
          >
            {`Away from the manic energy of Japan's `.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`bio-desc1-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${wordIndex * 30}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
            {`famous metropoles, lies the `.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`bio-desc2-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${(5 + wordIndex) * 30}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
            {`ancient hamlet of Noto. `.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`bio-desc3-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${(10 + wordIndex) * 30}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
            <br />
            {`Surprising and captivating in equal measure, `.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`bio-desc4-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${(15 + wordIndex) * 30}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
            {`Noto is a region like no other. `.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`bio-desc5-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${(25 + wordIndex) * 30}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
            <br />
            {`Soaring peaks, lakes and endless waterfalls `.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`bio-desc6-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${(30 + wordIndex) * 30}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
            {`combine to form a habitat for a `.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`bio-desc7-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${(35 + wordIndex) * 30}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
            {`biodiverse range of species. `.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`bio-desc8-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${(40 + wordIndex) * 30}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
            <br />
            {`Away from the manic energy of Japan's `.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`bio-desc9-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${(45 + wordIndex) * 30}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
            {`famous metropoles lies the `.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`bio-desc10-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${(50 + wordIndex) * 30}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
            {`ancient hamlet of Noto. `.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`bio-desc11-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${(55 + wordIndex) * 30}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
            {`Surprising and captivating.`.split(' ').map((word, wordIndex, allWords) => (
              <span 
                key={`bio-desc12-${wordIndex}`}
                data-scroll-effect="fade"
                className="transition-all duration-300 ease-out"
                style={{ 
                  animationDelay: `${(60 + wordIndex) * 30}ms`,
                  display: 'inline',
                  whiteSpace: 'nowrap'
                }}
              >
                {word}{wordIndex < allWords.length - 1 ? ' ' : ''}
              </span>
            ))}
          </p>
          
          <div 
            className="flex space-x-6"
          >
            <button 
              onClick={handleScrollToPrev}
              className="inline-flex items-center gap-3 text-foreground hover:text-primary transition-colors group"
            >
              <span className="w-12 h-px bg-foreground group-hover:bg-primary transition-colors"></span>
              <span className="text-lg">Prev</span>
            </button>
          </div>
        </div>
      </div>
      
      {/* Creative transition overlay */}
      <div className="absolute top-0 left-0 right-0 h-32 bg-gradient-to-b from-background to-transparent pointer-events-none"></div>
    </section>
  );
};

export default Hero;
