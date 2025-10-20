import { CreativeScrollProvider } from "@/contexts/CreativeScrollContext";
import ScrollIndicator from "@/components/ScrollIndicator";
import Header from "@/components/Header";
import VisiteHero from "@/components/VisiteHero";
import Hero from "@/components/Hero";
import TranquilitySection from "@/components/TranquilitySection";

const Index = () => {
  const sections = [
    { id: "visite", title: "Visite", description: "Journey to new frontiers, journey to Noto Nature Park" },
    { id: "tranquility", title: "Tranquility", description: "Experience the peaceful moments in nature" },
    { id: "biodiversity", title: "Biodiversity", description: "Discover the rich habitat of Noto" }
  ];

  return (
    <CreativeScrollProvider sections={sections}>
      <div className="min-h-screen bg-background relative">
        <ScrollIndicator sections={sections} />
        <Header />
        <VisiteHero />
        <TranquilitySection />
        <Hero />
        <div className="page-transition-overlay"></div>
      </div>
    </CreativeScrollProvider>
  );
};

export default Index;
