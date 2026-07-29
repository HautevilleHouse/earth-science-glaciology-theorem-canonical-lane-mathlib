import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheorem

structure SeaLevelProjection where
  iceVolume : ℝ
  oceanArea : ℝ
  seawaterDensity : ℝ
  freshWaterDensity : ℝ
  seaLevelRise : ℝ

def SeaLevelContribution (SL : SeaLevelProjection) : ℝ :=
  SL.iceVolume * (SL.freshWaterDensity / SL.seawaterDensity) / SL.oceanArea

structure SeaLevelEvidence (SL : SeaLevelProjection) where
  iceVolumePositive : SL.iceVolume > 0
  oceanAreaPositive : SL.oceanArea > 0
  seawaterDensityPositive : SL.seawaterDensity > 0
  freshWaterDensityPositive : SL.freshWaterDensity > 0
  seaLevelRiseNonnegative : SL.seaLevelRise ≥ 0

def SeaLevelProjectionClosed (SL : SeaLevelProjection) : Prop :=
  SL.iceVolume > 0 ∧ SL.oceanArea > 0 ∧
  SL.seawaterDensity > 0 ∧ SL.freshWaterDensity > 0 ∧
  SL.seaLevelRise ≥ 0

theorem sea_level_projection_closed_from_evidence (SL : SeaLevelProjection)
    (E : SeaLevelEvidence SL) : SeaLevelProjectionClosed SL := by
  exact And.intro E.iceVolumePositive
    (And.intro E.oceanAreaPositive
      (And.intro E.seawaterDensityPositive
        (And.intro E.freshWaterDensityPositive E.seaLevelRiseNonnegative)))

end EarthScienceGlaciologyTheorem
end HautevilleHouse