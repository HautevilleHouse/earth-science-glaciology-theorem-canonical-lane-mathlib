import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheorem

structure SteadyStateClosure where
  massBalance : ℝ
  fluxDivergence : ℝ → ℝ
  accumulationRate : ℝ → ℝ
  ablationRate : ℝ → ℝ
  equilibriumLineAltitude : ℝ

def SteadyStateCondition (SS : SteadyStateClosure) : Prop :=
  (∀ x, SS.fluxDivergence x = SS.accumulationRate x - SS.ablationRate x) ∧
  SS.massBalance = 0 ∧ SS.equilibriumLineAltitude > 0

structure SteadyStateEvidence (SS : SteadyStateClosure) where
  fluxGradientClosed : ∀ x, SS.fluxDivergence x = SS.accumulationRate x - SS.ablationRate x
  massBalanceClosed : SS.massBalance = 0
  equilibriumLineAltitudeClosed : SS.equilibriumLineAltitude > 0

theorem steady_state_closed_from_evidence (SS : SteadyStateClosure)
    (E : SteadyStateEvidence SS) : SteadyStateCondition SS := by
  exact And.intro E.fluxGradientClosed (And.intro E.massBalanceClosed E.equilibriumLineAltitudeClosed)

end EarthScienceGlaciologyTheorem
end HautevilleHouse