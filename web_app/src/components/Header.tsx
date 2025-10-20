import { Button } from "@/components/ui/button";

const Header = () => {
  return (
    <header className="fixed top-0 left-0 right-0 z-50 bg-background/80 backdrop-blur-md border-b border-border/50">
      <nav className="container mx-auto px-6 py-4 flex items-center justify-between">
        <div className="text-2xl font-light tracking-tight">
          Notosan
        </div>
        
        <div className="hidden md:flex items-center gap-8">
          <a href="#community" className="text-foreground/80 hover:text-foreground transition-all duration-300">
            Community
          </a>
          <a href="#about" className="text-foreground/80 hover:text-foreground transition-all duration-300">
            About
          </a>
          <a href="#support" className="text-foreground/80 hover:text-foreground transition-all duration-300">
            Support
          </a>
          <a href="#contact" className="text-foreground/80 hover:text-foreground transition-all duration-300">
            Contact
          </a>
          <Button variant="outline" className="border-foreground/30 hover:bg-foreground/10 transition-all duration-300">
            Register
          </Button>
        </div>
      </nav>
    </header>
  );
};

export default Header;
