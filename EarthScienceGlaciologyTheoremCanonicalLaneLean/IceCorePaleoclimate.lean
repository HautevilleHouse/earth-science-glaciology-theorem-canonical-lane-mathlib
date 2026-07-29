import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure IceCorePaleoclimatePackage where
  iceCoreRecord : Type
  isotopeProxy : Type
  gasTrap : Type
  ageDepthModel : Prop
  climateProxyCalibration : Prop
  orbitalForcingLink : Prop
  ageDepthModelClosed : ageDepthModel
  climateProxyCalibrationClosed : climateProxyCalibration
  orbitalForcingLinkClosed : orbitalForcingLink

structure IceCorePaleoclimateEvidence (I : IceCorePaleoclimatePackage) where
  ageDepthModelClosed : I.ageDepthModel
  climateProxyCalibrationClosed : I.climateProxyCalibration
  orbitalForcingLinkClosed : I.orbitalForcingLink

def IceCorePaleoclimateClosed (I : IceCorePaleoclimatePackage) : Prop :=
  I.ageDepthModel ∧ I.climateProxyCalibration ∧ I.orbitalForcingLink

theorem ice_core_paleoclimate_closed_from_evidence (I : IceCorePaleoclimatePackage) (E : IceCorePaleoclimateEvidence I) : IceCorePaleoclimateClosed I := by
  exact And.intro E.ageDepthModelClosed (And.intro E.climateProxyCalibrationClosed E.orbitalForcingLinkClosed)

end EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse