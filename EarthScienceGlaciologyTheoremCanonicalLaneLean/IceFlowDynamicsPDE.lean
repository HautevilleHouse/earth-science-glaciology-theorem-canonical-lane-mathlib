import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheorem

structure IceFlowDynamicsPDE where
  flowLawExponent : ℝ
  glensLawConstant : ℝ
  effectivePressure : ℝ → ℝ
  strainRate : ℝ → ℝ
  stressDeviator : ℝ → ℝ
  partialDifferentialEquation : Prop

structure IceFlowPDEEvidence (P : IceFlowDynamicsPDE) where
  flowLawExponentPositive : P.flowLawExponent > 0
  glensLawConstantPositive : P.glensLawConstant > 0
  effectivePressureDefined : ∀ t, P.effectivePressure t > 0
  strainRateBounded : ∀ t, P.strainRate t < ∞
  stressDeviatorBounded : ∀ t, P.stressDeviator t < 1e8

def IceFlowPDEClosed (P : IceFlowDynamicsPDE) : Prop :=
  P.flowLawExponent > 0 ∧ P.glensLawConstant > 0 ∧
  (∀ t, P.effectivePressure t > 0) ∧ (∀ t, P.strainRate t < ∞) ∧
  (∀ t, P.stressDeviator t < 1e8)

theorem ice_flow_pde_closed_from_evidence (P : IceFlowDynamicsPDE)
    (E : IceFlowPDEEvidence P) : IceFlowPDEClosed P := by
  exact And.intro E.flowLawExponentPositive
    (And.intro E.glensLawConstantPositive
      (And.intro E.effectivePressureDefined
        (And.intro E.strainRateBounded E.stressDeviatorBounded)))

end EarthScienceGlaciologyTheorem
end HautevilleHouse