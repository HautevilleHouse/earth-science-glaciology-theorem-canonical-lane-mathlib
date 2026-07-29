import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure SeaLevelContributionPackage where
  iceVolumeChange : Type
  thermalExpansion : Type
  glacialIsostaticAdjustment : Prop
  satelliteAltimetryCalibrated : Prop
  seaLevelBudgetClosed : Prop

structure SeaLevelContributionEvidence (S : SeaLevelContributionPackage) where
  glacialIsostaticAdjustmentClosed : S.glacialIsostaticAdjustment
  satelliteAltimetryCalibratedClosed : S.satelliteAltimetryCalibrated
  seaLevelBudgetClosedClosed : S.seaLevelBudgetClosed

def SeaLevelContributionClosed (S : SeaLevelContributionPackage) : Prop :=
  S.glacialIsostaticAdjustment ∧ S.satelliteAltimetryCalibrated ∧ S.seaLevelBudgetClosed

theorem sea_level_contribution_closed_from_evidence
    (S : SeaLevelContributionPackage) (E : SeaLevelContributionEvidence S) :
    SeaLevelContributionClosed S := by
  exact And.intro E.glacialIsostaticAdjustmentClosed
    (And.intro E.satelliteAltimetryCalibratedClosed E.seaLevelBudgetClosedClosed)

end HautevilleHouse.EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse