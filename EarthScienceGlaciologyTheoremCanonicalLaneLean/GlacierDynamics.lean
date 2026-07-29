import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure GlacierDynamicsPackage where
  iceVelocityField : Type u
  drivingStress : Prop
  gravitationalDrivingForce : Prop
  momentumBalanceEquation : Prop
  iceThicknessEvolution : Prop

structure GlacierDynamicsEvidence (G : GlacierDynamicsPackage) where
  drivingStressClosed : G.drivingStress
  gravitationalDrivingForceClosed : G.gravitationalDrivingForce
  momentumBalanceEquationClosed : G.momentumBalanceEquation
  iceThicknessEvolutionClosed : G.iceThicknessEvolution

def GlacierDynamicsClosed (G : GlacierDynamicsPackage) : Prop :=
  G.drivingStress ∧ G.gravitationalDrivingForce ∧
  G.momentumBalanceEquation ∧ G.iceThicknessEvolution

theorem glacier_dynamics_closed_from_evidence
    (G : GlacierDynamicsPackage) (E : GlacierDynamicsEvidence G) :
    GlacierDynamicsClosed G := by
  exact And.intro E.drivingStressClosed
    (And.intro E.gravitationalDrivingForceClosed
      (And.intro E.momentumBalanceEquationClosed E.iceThicknessEvolutionClosed))

end EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse