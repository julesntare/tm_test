import { Button } from "@/components/ui/button";
import { useCreativeScrollContext } from "@/contexts/CreativeScrollContext";

const Header = () => {
  const { scrollToSection } = useCreativeScrollContext();
  const sections = [
    { id: "visite", title: "Visite", description: "Journey to new frontiers, journey to Noto Nature Park" },
    { id: "tranquility", title: "Tranquility", description: "Experience the peaceful moments in nature" },
    { id: "biodiversity", title: "Biodiversity", description: "Discover the rich habitat of Noto" }
  ];

  const handleNavClick = (sectionId: string) => {
    const index = sections.findIndex(section => section.id === sectionId);
    if (index !== -1) {
      scrollToSection(index);
    }
  };

  return (
    <header className="fixed top-0 left-0 right-0 z-50 bg-background/80 backdrop-blur-md border-b border-border/50">
      <nav className="container mx-auto px-6 py-4 flex items-center justify-between">
        <div 
          className="text-2xl font-light tracking-tight text-primary cursor-pointer"
          onClick={() => scrollToSection(0)}
        >
          {`Notosan`.split('').map((char, index) => (
            <span 
              key={`logo-${index}`}
              className="inline-block transition-all duration-500 ease-out"
              style={{ 
                animationDelay: `${index * 50}ms`,
                opacity: 1,
                transform: 'translateY(0)',
              }}
            >
              {char}
            </span>
          ))}
        </div>
        
        <div className="hidden md:flex items-center gap-8">
          <button 
            onClick={() => handleNavClick("visite")}
            className="text-foreground/80 hover:text-foreground transition-all duration-300 text-sm tracking-wide uppercase"
          >
            Visite
          </button>
          <button 
            onClick={() => handleNavClick("tranquility")}
            className="text-foreground/80 hover:text-foreground transition-all duration-300 text-sm tracking-wide uppercase"
          >
            Tranquility
          </button>
          <button 
            onClick={() => handleNavClick("biodiversity")}
            className="text-foreground/80 hover:text-foreground transition-all duration-300 text-sm tracking-wide uppercase"
          >
            Biodiversity
          </button>
          <Button 
            variant="outline" 
            className="border-foreground/30 hover:bg-foreground/10 transition-all duration-300 text-sm"
          >
            Register
          </Button>
        </div>
      </nav>
    </header>
  );
};

export default Header;
