import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheorem

structure MassBalanceDynamics where
  surfaceMassBalance : ℝ
  basalMassBalance : ℝ
  internalMassBalance : ℝ
  climaticForcing : ℝ
  seaLevelContribution : ℝ

def NetMassBalance (MB : MassBalanceDynamics) : ℝ :=
  MB.surfaceMassBalance + MB.basalMassBalance + MB.internalMassBalance

structure MassBalanceEvidence (MB : MassBalanceDynamics) where
  surfaceMassBalanceFinite : MB.surfaceMassBalance ≠ ∞ ∧ MB.surfaceMassBalance ≠ -∞
  basalMassBalanceFinite : MB.basalMassBalance ≠ ∞ ∧ MB.basalMassBalance ≠ -∞
  internalMassBalanceFinite : MB.internalMassBalance ≠ ∞ ∧ MB.internalMassBalance ≠ -∞
  climaticForcingFInite : MB.climaticForcing ≠ ∞ ∧ MB.climaticForcing ≠ -∞
  seaLevelContributionFinite : MB.seaLevelContribution ≠ ∞ ∧ MB.seaLevelContribution ≠ -∞

def MassBalanceClosed (MB : MassBalanceDynamics) : Prop :=
  (MB.surfaceMassBalance ≠ ∞ ∧ MB.surfaceMassBalance ≠ -∞) ∧
  (MB.basalMassBalance ≠ ∞ ∧ MB.basalMassBalance ≠ -∞) ∧
  (MB.internalMassBalance ≠ ∞ ∧ MB.internalMassBalance ≠ -∞) ∧
  (MB.climaticForcing ≠ ∞ ∧ MB.climaticForcing ≠ -∞) ∧
  (MB.seaLevelContribution ≠ ∞ ∧ MB.seaLevelContribution ≠ -∞)

theorem mass_balance_closed_from_evidence (MB : MassBalanceDynamics)
    (E : MassBalanceEvidence MB) : MassBalanceClosed MB := by
  exact And.intro E.surfaceMassBalanceFinite
    (And.intro E.basalMassBalanceFinite
      (And.intro E.internalMassBalanceFinite
        (And.intro E.climaticForcingFInite E.seaLevelContributionFinite)))

end EarthScienceGlaciologyTheorem
end HautevilleHouse