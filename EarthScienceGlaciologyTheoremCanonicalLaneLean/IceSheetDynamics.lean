import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure IceSheetDynamicsPackage where
  iceFlowModel : Prop
  basalSliding : Prop
  groundingLineMigration : Prop
  subglacialHydrology : Prop

structure IceSheetDynamicsEvidence (D : IceSheetDynamicsPackage) where
  iceFlowModelClosed : D.iceFlowModel
  basalSlidingClosed : D.basalSliding
  groundingLineMigrationClosed : D.groundingLineMigration
  subglacialHydrologyClosed : D.subglacialHydrology

def IceSheetDynamicsClosed (D : IceSheetDynamicsPackage) : Prop :=
  D.iceFlowModel ∧ D.basalSliding ∧ D.groundingLineMigration ∧ D.subglacialHydrology

theorem ice_sheet_dynamics_closed_from_evidence (D : IceSheetDynamicsPackage)
    (E : IceSheetDynamicsEvidence D) : IceSheetDynamicsClosed D := by
  exact And.intro E.iceFlowModelClosed
    (And.intro E.basalSlidingClosed
      (And.intro E.groundingLineMigrationClosed E.subglacialHydrologyClosed))

end EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse