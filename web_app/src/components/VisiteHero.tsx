import { Button } from "@/components/ui/button";
import { ArrowRight } from "lucide-react";
import visiteHero from "@/assets/visite-hero.jpg";

const VisiteHero = () => {
  const scrollToBiodiversity = () => {
    document.getElementById('biodiversity')?.scrollIntoView({ 
      behavior: 'smooth' 
    });
  };

  return (
    <section id="visite" className="relative min-h-screen flex items-center overflow-hidden">
      {/* Background Image */}
      <div 
        className="absolute inset-0 bg-cover bg-center bg-no-repeat"
        style={{ backgroundImage: `url(${visiteHero})` }}
      >
        <div className="absolute inset-0 bg-gradient-to-b from-background/30 via-background/50 to-background/80"></div>
      </div>
      
      {/* Content */}
      <div className="container mx-auto px-6 py-32 relative z-10">
        <div className="max-w-3xl animate-fade-in-up">
          <p className="text-muted-foreground text-sm mb-8 tracking-wider uppercase flex items-center gap-3">
            <span className="w-8 h-px bg-muted-foreground"></span>
            Journey to new frontiers, journey to Noto Nature Park
          </p>
          
          <h1 className="text-[10rem] md:text-[12rem] font-light mb-8 leading-none tracking-tighter">
            VISITE
          </h1>
          
          <p className="text-foreground/80 text-lg mb-12 leading-relaxed max-w-xl">
            Away from the manic energy of Japan's famous metropoles lies the ancient hamlet of Noto. Surprising and captivating in equal measure. Noto is a region like no other. Soaring peaks, lakes and endless waterfalls.
          </p>
          
          <Button 
            onClick={scrollToBiodiversity}
            className="bg-foreground text-background hover:bg-foreground/90 transition-all duration-300 group"
            size="lg"
          >
            Start the journey
            <ArrowRight className="ml-2 h-5 w-5 group-hover:translate-x-1 transition-transform" />
          </Button>
        </div>
      </div>
    </section>
  );
};

export default VisiteHero;
