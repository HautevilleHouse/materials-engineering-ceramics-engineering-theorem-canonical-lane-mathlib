import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean

structure CrystallographyPackage where
  bravaisLattice : Type
  latticeParameters : Type
  spaceGroup : String
  powderPattern : Prop

structure PhaseDiagramPackage where
  components : List String
  stablePhases : List String
  eutecticPoint : Prop
  congruentTransformations : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) (P : PhaseDiagramPackage) where
  phaseStableTemperatureRange : Prop
  latticeMismatchBound : Prop
  thermalExpansionAnisotropy : Prop

def CrystallographyClosed (C : CrystallographyPackage) (P : PhaseDiagramPackage) : Prop :=
  C.bravaisLattice ≠ Unit ∧ C.spaceGroup ≠ ""

theorem crystallography_closed (C : CrystallographyPackage) (P : PhaseDiagramPackage) :
    CrystallographyClosed C P := by
  exact And.intro (by
    exact Nat.zero_ne_succ 0)
    (by
    intro h
    have : C.spaceGroup = "" := h
    have : C.spaceGroup ≠ "" := by
      exact String.ne_nil _
    exact this rfl)

end MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
