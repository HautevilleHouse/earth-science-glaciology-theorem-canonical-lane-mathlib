import EarthScienceGlaciologyTheoremCanonicalLaneLean.IceSheetModel

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure BasalThermalState (I : IceSheetModel) where
  temperatureAtIceBase : Prop
  pressureMeltingPoint : Prop
  geothermalFlux : Prop
  frictionalHeating : Prop
  basalWaterPressure : Prop

structure BasalThermalStateEvidence {I : IceSheetModel} (B : BasalThermalState I) where
  temperatureAtIceBaseMeasured : B.temperatureAtIceBase
  pressureMeltingPointReached : B.pressureMeltingPoint
  geothermalFluxDetermined : B.geothermalFlux
  frictionalHeatingComputed : B.frictionalHeating
  basalWaterPressureClosed : B.basalWaterPressure

def BasalThermalStateClosed {I : IceSheetModel} (B : BasalThermalState I) : Prop :=
  B.temperatureAtIceBase ∧ B.pressureMeltingPoint ∧ B.geothermalFlux ∧ B.frictionalHeating ∧ B.basalWaterPressure

theorem basal_thermal_state_closed_from_evidence {I : IceSheetModel} (B : BasalThermalState I)
    (E : BasalThermalStateEvidence B) : BasalThermalStateClosed B := by
  exact And.intro E.temperatureAtIceBaseMeasured
    (And.intro E.pressureMeltingPointReached
      (And.intro E.geothermalFluxDetermined
        (And.intro E.frictionalHeatingComputed E.basalWaterPressureClosed)))

end EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse
