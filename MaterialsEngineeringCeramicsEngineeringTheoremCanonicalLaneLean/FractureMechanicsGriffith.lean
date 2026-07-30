import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean

structure FractureModes where
  modeI : Prop
  modeII : Prop
  modeIII : Prop

structure FracturePackage where
  fractureToughnessIC : ℚ
  fractureToughnessIIC : ℚ
  fractureToughnessIIIC : ℚ
  criticalCrackLength : ℚ
  griffithCriterion : ℚ → ℚ → Prop
  stressIntensityFactor : ℚ → ℚ → ℚ → ℚ
  crackTipPlasticityCorrection : Prop
  fractureModes : FractureModes

structure FractureEvidence (F : FracturePackage) where
  toughnessPositive : F.fractureToughnessIC > 0 ∧ F.fractureToughnessIIC > 0 ∧ F.fractureToughnessIIIC > 0
  criticalLengthPositive : F.criticalCrackLength > 0
  griffithCriterionSatisfied : F.griffithCriterion F.fractureToughnessIC F.criticalCrackLength
  stressIntensityComputed : Prop
  modesCovered : F.fractureModes.modeI ∨ F.fractureModes.modeII ∨ F.fractureModes.modeIII

def FractureClosed (F : FracturePackage) : Prop :=
  F.fractureToughnessIC > 0 ∧ F.fractureToughnessIIC > 0 ∧ F.fractureToughnessIIIC > 0 ∧
  F.criticalCrackLength > 0 ∧ (F.fractureModes.modeI ∨ F.fractureModes.modeII ∨ F.fractureModes.modeIII)

theorem fracture_closed_from_evidence (F : FracturePackage) (E : FractureEvidence F) :
    FractureClosed F := by
  rcases E.toughnessPositive with ⟨hI, hII, hIII⟩
  refine And.intro hI (And.intro hII (And.intro hIII (And.intro E.criticalLengthPositive E.modesCovered)))

end MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse