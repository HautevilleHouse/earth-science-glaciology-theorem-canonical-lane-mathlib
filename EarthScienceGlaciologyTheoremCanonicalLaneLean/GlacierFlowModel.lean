import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure GlacierFlowDomain where
  spaceTime : Type
  iceVelocity : Type
  basalShearStress : Type
  glacierGeometry : Prop
  flowLawValid : Prop
  boundaryConditionsProp : Prop

structure GlacierFlowEvidence (D : GlacierFlowDomain) where
  glacierGeometryClosed : D.glacierGeometry
  flowLawValidClosed : D.flowLawValid
  boundaryConditionsClosed : D.boundaryConditionsProp

def GlacierFlowClosed (D : GlacierFlowDomain) : Prop :=
  D.glacierGeometry ∧ D.flowLawValid ∧ D.boundaryConditionsProp

theorem glacier_flow_closed_from_evidence (D : GlacierFlowDomain)
    (E : GlacierFlowEvidence D) : GlacierFlowClosed D := by
  exact And.intro E.glacierGeometryClosed
    (And.intro E.flowLawValidClosed E.boundaryConditionsClosed)

end HautevilleHouse.EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse