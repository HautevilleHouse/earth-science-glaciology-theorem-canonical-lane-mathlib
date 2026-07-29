import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure IceFlowRheologyPackage where
  iceSheetGeometry : Type u
  temperatureField : Type v
  stressTensor : Type w
  strainRateTensor : Type x
  creepResponse : Prop
  basalSlidingLaw : Prop
  flowEnhancementFactor : Prop

structure IceFlowRheologyEvidence (R : IceFlowRheologyPackage) where
  creepResponseClosed : R.creepResponse
  basalSlidingLawClosed : R.basalSlidingLaw
  flowEnhancementFactorClosed : R.flowEnhancementFactor

def IceFlowRheologyClosed (R : IceFlowRheologyPackage) : Prop :=
  R.creepResponse ∧ R.basalSlidingLaw ∧ R.flowEnhancementFactor

theorem ice_flow_rheology_closed_from_evidence
    (R : IceFlowRheologyPackage) (E : IceFlowRheologyEvidence R) :
    IceFlowRheologyClosed R := by
  exact And.intro E.creepResponseClosed
    (And.intro E.basalSlidingLawClosed E.flowEnhancementFactorClosed)

end EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse