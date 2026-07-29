import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheorem

structure ClimateCoupling where
  atmosphericTemperature : ℝ → ℝ
  oceanicTemperature : ℝ → ℝ
  precipitationRate : ℝ → ℝ
  albedo : ℝ
  positiveFeedbackGain : ℝ

def ClimateCouplingClosed (C : ClimateCoupling) : Prop :=
  (∀ t, C.atmosphericTemperature t > -100 ∧ C.atmosphericTemperature t < 100) ∧
  (∀ t, C.oceanicTemperature t > -10 ∧ C.oceanicTemperature t < 40) ∧
  (∀ t, C.precipitationRate t ≥ 0) ∧
  C.albedo ≥ 0 ∧ C.albedo ≤ 1 ∧
  C.positiveFeedbackGain > 0 ∧ C.positiveFeedbackGain < 1

structure ClimateCouplingEvidence (C : ClimateCoupling) where
  atmosphericTemperatureClosed : ∀ t, C.atmosphericTemperature t > -100 ∧ C.atmosphericTemperature t < 100
  oceanicTemperatureClosed : ∀ t, C.oceanicTemperature t > -10 ∧ C.oceanicTemperature t < 40
  precipitationRateClosed : ∀ t, C.precipitationRate t ≥ 0
  albedoClosed : C.albedo ≥ 0 ∧ C.albedo ≤ 1
  positiveFeedbackGainClosed : C.positiveFeedbackGain > 0 ∧ C.positiveFeedbackGain < 1

theorem climate_coupling_closed_from_evidence (C : ClimateCoupling)
    (E : ClimateCouplingEvidence C) : ClimateCouplingClosed C := by
  exact And.intro E.atmosphericTemperatureClosed
    (And.intro E.oceanicTemperatureClosed
      (And.intro E.precipitationRateClosed
        (And.intro E.albedoClosed E.positiveFeedbackGainClosed)))

end EarthScienceGlaciologyTheorem
end HautevilleHouse