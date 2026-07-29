import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure IceCoreRecordPackage where
  coreLocation : Type
  depthAgeRelation : Type
  isotopicComposition : Prop
  accumulationRate : Prop
  volcanicHorizons : Prop

structure IceCoreRecordEvidence (R : IceCoreRecordPackage) where
  isotopicCompositionClosed : R.isotopicComposition
  accumulationRateClosed : R.accumulationRate
  volcanicHorizonsClosed : R.volcanicHorizons

def IceCoreRecordClosed (R : IceCoreRecordPackage) : Prop :=
  R.isotopicComposition ∧ R.accumulationRate ∧ R.volcanicHorizons

theorem ice_core_record_closed_from_evidence (R : IceCoreRecordPackage)
    (E : IceCoreRecordEvidence R) : IceCoreRecordClosed R := by
  exact And.intro E.isotopicCompositionClosed
    (And.intro E.accumulationRateClosed E.volcanicHorizonsClosed)

end HautevilleHouse.EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse