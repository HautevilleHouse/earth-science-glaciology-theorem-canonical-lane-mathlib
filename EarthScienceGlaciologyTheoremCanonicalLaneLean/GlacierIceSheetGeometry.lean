import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheorem

structure GlacierIceSheetGeometry where
  iceSheetSurface : Type u
  bedTopography : Type v
  iceThickness : iceSheetSurface → ℝ
  surfaceSlope : iceSheetSurface → ℝ
  basalShearStress : iceSheetSurface → ℝ
  drivingStress : iceSheetSurface → ℝ

structure GlacierIceSheetEvidence (G : GlacierIceSheetGeometry) where
  iceThicknessPositive : ∀ x, G.iceThickness x > 0
  surfaceSlopeFinite : ∀ x, G.surfaceSlope x < ∞
  basalShearStressBounded : ∀ x, G.basalShearStress x < 1e6
  drivingStressNonnegative : ∀ x, G.drivingStress x ≥ 0

def GlacierIceSheetClosed (G : GlacierIceSheetGeometry) : Prop :=
  (∀ x, G.iceThickness x > 0) ∧ (∀ x, G.surfaceSlope x < ∞) ∧
  (∀ x, G.basalShearStress x < 1e6) ∧ (∀ x, G.drivingStress x ≥ 0)

theorem glacier_ice_sheet_closed_from_evidence (G : GlacierIceSheetGeometry)
    (E : GlacierIceSheetEvidence G) : GlacierIceSheetClosed G := by
  exact And.intro E.iceThicknessPositive
    (And.intro E.surfaceSlopeFinite
      (And.intro E.basalShearStressBounded E.drivingStressNonnegative))

end EarthScienceGlaciologyTheorem
end HautevilleHouse