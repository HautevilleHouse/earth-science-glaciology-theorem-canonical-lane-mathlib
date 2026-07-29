import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure CalvingLawPackage where
  calvingFrontPosition : Type
  crevasseDepth : Type
  terminusStress : Type
  vonMisesCriterion : Prop
  crevasseWaterDepth : Prop
  calvingRateClosure : Prop
  vonMisesCriterionClosed : vonMisesCriterion
  crevasseWaterDepthClosed : crevasseWaterDepth
  calvingRateClosureClosed : calvingRateClosure

structure CalvingLawEvidence (C : CalvingLawPackage) where
  vonMisesCriterionClosed : C.vonMisesCriterion
  crevasseWaterDepthClosed : C.crevasseWaterDepth
  calvingRateClosureClosed : C.calvingRateClosure

def CalvingLawClosed (C : CalvingLawPackage) : Prop :=
  C.vonMisesCriterion ∧ C.crevasseWaterDepth ∧ C.calvingRateClosure

theorem calving_law_closed_from_evidence (C : CalvingLawPackage) (E : CalvingLawEvidence C) : CalvingLawClosed C := by
  exact And.intro E.vonMisesCriterionClosed (And.intro E.crevasseWaterDepthClosed E.calvingRateClosureClosed)

end EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse