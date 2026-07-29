import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure GlacierMassBalancePackage where
  accumulationZone : Prop
  ablationZone : Prop
  massBalanceGradient : Prop
  equilibriumLineAltitude : Prop

structure GlacierMassBalanceEvidence (G : GlacierMassBalancePackage) where
  accumulationZoneClosed : G.accumulationZone
  ablationZoneClosed : G.ablationZone
  massBalanceGradientClosed : G.massBalanceGradient
  equilibriumLineAltitudeClosed : G.equilibriumLineAltitude

def GlacierMassBalanceClosed (G : GlacierMassBalancePackage) : Prop :=
  G.accumulationZone ∧ G.ablationZone ∧ G.massBalanceGradient ∧ G.equilibriumLineAltitude

theorem glacier_mass_balance_closed_from_evidence (G : GlacierMassBalancePackage)
    (E : GlacierMassBalanceEvidence G) : GlacierMassBalanceClosed G := by
  exact And.intro E.accumulationZoneClosed
    (And.intro E.ablationZoneClosed
      (And.intro E.massBalanceGradientClosed E.equilibriumLineAltitudeClosed))

end EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse