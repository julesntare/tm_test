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
        <div 
          className="max-w-3xl opacity-0 translate-y-10"
          style={{ animation: 'slideInLeft 0.8s ease-out 0.3s forwards' }}
        >
          <p 
            className="text-muted-foreground text-sm mb-8 tracking-wider uppercase flex items-center gap-3 opacity-0"
            style={{ animation: 'fadeIn 0.8s ease-out 0.5s forwards' }}
          >
            <span className="w-8 h-px bg-muted-foreground"></span>
            Journey to new frontiers, journey to Noto Nature Park
          </p>
          
          <h1 
            className="text-[10rem] md:text-[12rem] font-light mb-8 leading-none tracking-tighter opacity-0"
            style={{ animation: 'rotateIn 0.8s ease-out 0.7s forwards' }}
          >
            VISITE
          </h1>
          
          <p 
            className="text-foreground/80 text-lg mb-12 leading-relaxed max-w-xl opacity-0"
            style={{ animation: 'fadeIn 0.8s ease-out 1s forwards' }}
          >
            Away from the manic energy of Japan's famous metropoles lies the ancient hamlet of Noto. Surprising and captivating in equal measure. Noto is a region like no other. Soaring peaks, lakes and endless waterfalls.
          </p>
          
          <Button 
            onClick={handleScrollToNext}
            className="bg-foreground text-background hover:bg-foreground/90 transition-all duration-300 group opacity-0"
            size="lg"
            style={{ animation: 'fadeIn 0.8s ease-out 1.3s forwards' }}
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
