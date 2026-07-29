import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure GlacierGeometryPackage where
  bedTopography : Prop
  surfaceElevation : Prop
  iceThickness : Prop
  widthProfile : Prop
  flowlineCurvature : Prop

structure GlacierGeometryEvidence (G : GlacierGeometryPackage) where
  bedTopographyClosed : G.bedTopography
  surfaceElevationClosed : G.surfaceElevation
  iceThicknessClosed : G.iceThickness
  widthProfileClosed : G.widthProfile
  flowlineCurvatureClosed : G.flowlineCurvature

def GlacierGeometryClosed (G : GlacierGeometryPackage) : Prop :=
  G.bedTopography ∧ G.surfaceElevation ∧
  G.iceThickness ∧ G.widthProfile ∧ G.flowlineCurvature

theorem glacier_geometry_closed_from_evidence
    (G : GlacierGeometryPackage) (E : GlacierGeometryEvidence G) :
    GlacierGeometryClosed G := by
  exact And.intro E.bedTopographyClosed
    (And.intro E.surfaceElevationClosed
      (And.intro E.iceThicknessClosed
        (And.intro E.widthProfileClosed E.flowlineCurvatureClosed)))

end EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse