import tranquilityHero from "@/assets/tranquility-hero.jpg";

const TranquilitySection = () => {
  return (
    <section id="tranquility" className="relative min-h-screen flex items-center overflow-hidden scroll-mt-20">
      {/* Background Image */}
      <div 
        className="absolute inset-0 bg-cover bg-center bg-no-repeat"
        style={{ backgroundImage: `url(${tranquilityHero})` }}
      >
        <div className="absolute inset-0 bg-gradient-to-b from-background/40 via-background/60 to-background"></div>
      </div>
      
      {/* Content */}
      <div className="container mx-auto px-6 py-32 relative z-10">
        <div className="max-w-2xl ml-auto text-right animate-fade-in-up">
          <p className="text-muted-foreground text-sm mb-6 tracking-wider uppercase flex items-center justify-end gap-3">
            02/Experience
          </p>
          
          <h1 className="text-7xl md:text-8xl font-light mb-8 leading-none">
            Tranquility
          </h1>
          
          <div className="w-16 h-px bg-primary mb-8 ml-auto"></div>
          
          <p className="text-foreground/80 text-lg mb-12 leading-relaxed">
            Away from the manic energy of Japan's famous metropoles, lies the ancient hamlet of Noto. Surprising and captivating in equal measure, Noto is a region like no other. Soaring peaks, lakes and endless waterfalls combine to form a habitat for a biodiverse range of species. Away from the manic energy of Japan's famous metropoles lies the ancient hamlet of Noto. Surprising and captivating in equal measure, Noto is a region like no other. Soaring peaks, lakes and endless waterfalls combine to form a habitat for a biodiverse range of species.
          </p>
          
          <a 
            href="#learn-more" 
            className="inline-flex items-center gap-3 text-foreground hover:text-primary transition-colors group"
          >
            <span className="w-12 h-px bg-foreground group-hover:bg-primary transition-colors"></span>
            <span className="text-lg">Learn more</span>
          </a>
        </div>
      </div>
    </section>
  );
};

export default TranquilitySection;
