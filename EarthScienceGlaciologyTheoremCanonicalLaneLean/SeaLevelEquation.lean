import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure SeaLevelEquationPackage where
  globalMeanSeaLevel : Type
  stericComponent : Type
  massComponent : Type
  iceSheetContribution : Prop
  thermalExpansion : Prop
  massBalanceClosure : Prop
  iceSheetContributionClosed : iceSheetContribution
  thermalExpansionClosed : thermalExpansion
  massBalanceClosureClosed : massBalanceClosure

structure SeaLevelEquationEvidence (S : SeaLevelEquationPackage) where
  iceSheetContributionClosed : S.iceSheetContribution
  thermalExpansionClosed : S.thermalExpansion
  massBalanceClosureClosed : S.massBalanceClosure

def SeaLevelEquationClosed (S : SeaLevelEquationPackage) : Prop :=
  S.iceSheetContribution ∧ S.thermalExpansion ∧ S.massBalanceClosure

theorem sea_level_equation_closed_from_evidence (S : SeaLevelEquationPackage) (E : SeaLevelEquationEvidence S) : SeaLevelEquationClosed S := by
  exact And.intro E.iceSheetContributionClosed (And.intro E.thermalExpansionClosed E.massBalanceClosureClosed)

end EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse