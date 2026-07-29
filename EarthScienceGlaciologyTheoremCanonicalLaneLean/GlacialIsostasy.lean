import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure GlacialIsostasyPackage where
  lithosphereFlexure : Type
  mantleViscosity : Type
  isostaticRebound : Prop
  loadDeformationModel : Prop
  reboundTimescale : Prop
  isostaticReboundClosed : isostaticRebound
  loadDeformationModelClosed : loadDeformationModel
  reboundTimescaleClosed : reboundTimescale

structure GlacialIsostasyEvidence (G : GlacialIsostasyPackage) where
  isostaticReboundClosed : G.isostaticRebound
  loadDeformationModelClosed : G.loadDeformationModel
  reboundTimescaleClosed : G.reboundTimescale

def GlacialIsostasyClosed (G : GlacialIsostasyPackage) : Prop :=
  G.isostaticRebound ∧ G.loadDeformationModel ∧ G.reboundTimescale

theorem glacial_isostasy_closed_from_evidence (G : GlacialIsostasyPackage) (E : GlacialIsostasyEvidence G) : GlacialIsostasyClosed G := by
  exact And.intro E.isostaticReboundClosed (And.intro E.loadDeformationModelClosed E.reboundTimescaleClosed)

end EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse