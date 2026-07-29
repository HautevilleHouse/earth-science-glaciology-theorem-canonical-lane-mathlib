import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure GlacierFlowLinePackage where
  centerlineVelocity : Type
  shearStress : Type
  basalSlip : Type
  shallowIceApprox : Prop
  longitudinalStress : Prop
  basalBoundaryCondition : Prop
  shallowIceApproxClosed : shallowIceApprox
  longitudinalStressClosed : longitudinalStress
  basalBoundaryConditionClosed : basalBoundaryCondition

structure GlacierFlowLineEvidence (G : GlacierFlowLinePackage) where
  shallowIceApproxClosed : G.shallowIceApprox
  longitudinalStressClosed : G.longitudinalStress
  basalBoundaryConditionClosed : G.basalBoundaryCondition

def GlacierFlowLineClosed (G : GlacierFlowLinePackage) : Prop :=
  G.shallowIceApprox ∧ G.longitudinalStress ∧ G.basalBoundaryCondition

theorem glacier_flow_line_closed_from_evidence (G : GlacierFlowLinePackage) (E : GlacierFlowLineEvidence G) : GlacierFlowLineClosed G := by
  exact And.intro E.shallowIceApproxClosed (And.intro E.longitudinalStressClosed E.basalBoundaryConditionClosed)

end EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse