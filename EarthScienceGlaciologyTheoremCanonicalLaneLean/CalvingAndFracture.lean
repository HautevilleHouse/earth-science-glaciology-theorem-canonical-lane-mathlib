import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure CalvingAndFracturePackage where
  crevasseDepth : Prop
  calvingLaw : Prop
  fracturePropagation : Prop
  icebergDetachment : Prop

structure CalvingAndFractureEvidence (C : CalvingAndFracturePackage) where
  crevasseDepthClosed : C.crevasseDepth
  calvingLawClosed : C.calvingLaw
  fracturePropagationClosed : C.fracturePropagation
  icebergDetachmentClosed : C.icebergDetachment

def CalvingAndFractureClosed (C : CalvingAndFracturePackage) : Prop :=
  C.crevasseDepth ∧ C.calvingLaw ∧
  C.fracturePropagation ∧ C.icebergDetachment

theorem calving_and_fracture_closed_from_evidence
    (C : CalvingAndFracturePackage) (E : CalvingAndFractureEvidence C) :
    CalvingAndFractureClosed C := by
  exact And.intro E.crevasseDepthClosed
    (And.intro E.calvingLawClosed
      (And.intro E.fracturePropagationClosed E.icebergDetachmentClosed))

end EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse