import Header from "@/components/Header";
import VisiteHero from "@/components/VisiteHero";
import Hero from "@/components/Hero";
import TranquilitySection from "@/components/TranquilitySection";

const Index = () => {
  return (
    <div className="min-h-screen bg-background">
      <Header />
      <VisiteHero />
      <TranquilitySection />
      <Hero />
    </div>
  );
};

export default Index;
