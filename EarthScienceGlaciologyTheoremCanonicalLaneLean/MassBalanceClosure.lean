import EarthScienceGlaciologyTheoremCanonicalLaneLean.CalvingLaw

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure MassBalanceClosure {I : IceSheetModel} {G : GlacierFlowline I} {B : BasalThermalState I}
    (C : CalvingLaw B) where
  surfaceMassBalance : Prop
  basalMassBalance : Prop
  frontalAblation : Prop
  internalAccumulation : Prop
  netMassChangeRate : Prop

structure MassBalanceClosureEvidence {I : IceSheetModel} {G : GlacierFlowline I} {B : BasalThermalState I}
    {C : CalvingLaw B} (M : MassBalanceClosure C) where
  surfaceMassBalanceComputed : M.surfaceMassBalance
  basalMassBalanceComputed : M.basalMassBalance
  frontalAblationDetermined : M.frontalAblation
  internalAccumulationResolved : M.internalAccumulation
  netMassChangeRateClosed : M.netMassChangeRate

def MassBalanceClosureClosed {I : IceSheetModel} {G : GlacierFlowline I} {B : BasalThermalState I}
    {C : CalvingLaw B} (M : MassBalanceClosure C) : Prop :=
  M.surfaceMassBalance ∧ M.basalMassBalance ∧ M.frontalAblation ∧
  M.internalAccumulation ∧ M.netMassChangeRate

theorem mass_balance_closure_closed_from_evidence {I : IceSheetModel} {G : GlacierFlowline I}
    {B : BasalThermalState I} {C : CalvingLaw B} (M : MassBalanceClosure C)
    (E : MassBalanceClosureEvidence M) : MassBalanceClosureClosed M := by
  exact And.intro E.surfaceMassBalanceComputed
    (And.intro E.basalMassBalanceComputed
      (And.intro E.frontalAblationDetermined
        (And.intro E.internalAccumulationResolved E.netMassChangeRateClosed)))

end EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse
