import HautevilleHouse.EarthScienceGlaciologyTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : GlaciologyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GlaciologyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse