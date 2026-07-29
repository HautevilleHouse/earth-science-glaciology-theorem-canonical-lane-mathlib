import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure MassBalancePackage where
  accumulationRate : Prop
  ablationRate : Prop
  equilibriumLineAltitude : Prop
  climaticMassBalance : Prop

structure MassBalanceEvidence (M : MassBalancePackage) where
  accumulationRateClosed : M.accumulationRate
  ablationRateClosed : M.ablationRate
  equilibriumLineAltitudeClosed : M.equilibriumLineAltitude
  climaticMassBalanceClosed : M.climaticMassBalance

def MassBalanceClosed (M : MassBalancePackage) : Prop :=
  M.accumulationRate ∧ M.ablationRate ∧
  M.equilibriumLineAltitude ∧ M.climaticMassBalance

theorem mass_balance_closed_from_evidence
    (M : MassBalancePackage) (E : MassBalanceEvidence M) :
    MassBalanceClosed M := by
  exact And.intro E.accumulationRateClosed
    (And.intro E.ablationRateClosed
      (And.intro E.equilibriumLineAltitudeClosed E.climaticMassBalanceClosed))

end EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse