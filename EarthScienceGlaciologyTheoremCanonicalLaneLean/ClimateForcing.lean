import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure ClimateForcingPackage where
  temperatureAnomaly : Prop
  precipitationChange : Prop
  radiativeForcing : Prop
  surfaceEnergyBalance : Prop
  positiveFeedbackLoop : Prop

structure ClimateForcingEvidence (C : ClimateForcingPackage) where
  temperatureAnomalyClosed : C.temperatureAnomaly
  precipitationChangeClosed : C.precipitationChange
  radiativeForcingClosed : C.radiativeForcing
  surfaceEnergyBalanceClosed : C.surfaceEnergyBalance
  positiveFeedbackLoopClosed : C.positiveFeedbackLoop

def ClimateForcingClosed (C : ClimateForcingPackage) : Prop :=
  C.temperatureAnomaly ∧ C.precipitationChange ∧
  C.radiativeForcing ∧ C.surfaceEnergyBalance ∧
  C.positiveFeedbackLoop

theorem climate_forcing_closed_from_evidence
    (C : ClimateForcingPackage) (E : ClimateForcingEvidence C) :
    ClimateForcingClosed C := by
  exact And.intro E.temperatureAnomalyClosed
    (And.intro E.precipitationChangeClosed
      (And.intro E.radiativeForcingClosed
        (And.intro E.surfaceEnergyBalanceClosed E.positiveFeedbackLoopClosed)))

end EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse