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
        <div 
          className="max-w-2xl opacity-0 translate-y-10"
          style={{ animation: 'slideInLeft 0.8s ease-out 0.3s forwards' }}
        >
          <p 
            className="text-muted-foreground text-sm mb-6 tracking-wider uppercase opacity-0"
            style={{ animation: 'fadeIn 0.8s ease-out 0.5s forwards' }}
          >
            03/Habitat
          </p>
          
          <h1 
            className="text-7xl md:text-8xl font-light mb-8 leading-none opacity-0"
            style={{ animation: 'rotateIn 0.8s ease-out 0.7s forwards' }}
          >
            Biodiversity
          </h1>
          
          <div 
            className="w-16 h-px bg-primary mb-8 opacity-0"
            style={{ animation: 'fadeIn 0.8s ease-out 1s forwards' }}
          ></div>
          
          <p 
            className="text-foreground/80 text-lg mb-12 leading-relaxed max-w-xl opacity-0"
            style={{ animation: 'fadeIn 0.8s ease-out 1.2s forwards' }}
          >
            Away from the manic energy of Japan's famous metropoles, lies the ancient hamlet of Noto. Surprising and captivating in equal measure, Noto is a region like no other. Soaring peaks, lakes and endless waterfalls combine to form a habitat for a biodiverse range of species. Away from the manic energy of Japan's famous metropoles lies the ancient hamlet of Noto. Surprising and captivating.
          </p>
          
          <div 
            className="flex space-x-6 opacity-0"
            style={{ animation: 'fadeIn 0.8s ease-out 1.5s forwards' }}
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
