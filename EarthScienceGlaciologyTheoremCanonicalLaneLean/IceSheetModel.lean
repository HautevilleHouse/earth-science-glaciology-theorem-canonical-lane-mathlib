import EarthScienceGlaciologyTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyTheoremCanonicalLaneLean

structure IceSheetModel where
  surfaceSlope : Type u
  thickness : Type v
  basalSlip : Prop
  temperatureField : Prop
  stressBalance : Prop

structure IceSheetModelEvidence (I : IceSheetModel) where
  surfaceSlopeDefined : I.surfaceSlope
  thicknessMeasurable : I.thickness
  basalSlipComputed : I.basalSlip
  temperatureFieldResolved : I.temperatureField
  stressBalanceClosed : I.stressBalance

def IceSheetModelClosed (I : IceSheetModel) : Prop :=
  I.surfaceSlope ∧ I.thickness ∧ I.basalSlip ∧ I.temperatureField ∧ I.stressBalance

theorem ice_sheet_model_closed_from_evidence (I : IceSheetModel) (E : IceSheetModelEvidence I) :
    IceSheetModelClosed I := by
  exact And.intro E.surfaceSlopeDefined
    (And.intro E.thicknessMeasurable
      (And.intro E.basalSlipComputed
        (And.intro E.temperatureFieldResolved E.stressBalanceClosed)))

end EarthScienceGlaciologyTheoremCanonicalLaneLean
end HautevilleHouse
