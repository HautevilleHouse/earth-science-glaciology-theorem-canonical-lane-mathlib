import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure CalvingFrontPackage where
  crevassFormation : Type
  hydroFracture : Type
  iceCliffDynamics : Prop
  oceanThermalForcing : Prop
  calvingRateParametrized : Prop

structure CalvingFrontEvidence (C : CalvingFrontPackage) where
  iceCliffDynamicsClosed : C.iceCliffDynamics
  oceanThermalForcingClosed : C.oceanThermalForcing
  calvingRateParametrizedClosed : C.calvingRateParametrized

def CalvingFrontClosed (C : CalvingFrontPackage) : Prop :=
  C.iceCliffDynamics ∧ C.oceanThermalForcing ∧ C.calvingRateParametrized

theorem calving_front_closed_from_evidence (C : CalvingFrontPackage)
    (E : CalvingFrontEvidence C) : CalvingFrontClosed C := by
  exact And.intro E.iceCliffDynamicsClosed
    (And.intro E.oceanThermalForcingClosed E.calvingRateParametrizedClosed)

end HautevilleHouse.EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse