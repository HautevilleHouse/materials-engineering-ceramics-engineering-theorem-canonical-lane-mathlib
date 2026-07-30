import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean

structure PhaseDiagram where
  phases : List String
  temperatureRange : ℝ × ℝ
  compositionRange : ℝ × ℝ
  phaseBoundaries : Prop
  eutecticPoint : Prop

structure PhaseDiagramPackage where
  diagram : PhaseDiagram
  gibbsFreeEnergyMinimized : Prop
  leverRuleApplied : Prop
  phaseFractionsCalculated : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  gibbsFreeEnergyMinimizedClosed : P.gibbsFreeEnergyMinimized
  leverRuleAppliedClosed : P.leverRuleApplied
  phaseFractionsCalculatedClosed : P.phaseFractionsCalculated

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.gibbsFreeEnergyMinimized ∧ P.leverRuleApplied ∧ P.phaseFractionsCalculated

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) :
    PhaseDiagramClosed P := by
  exact And.intro E.gibbsFreeEnergyMinimizedClosed
    (And.intro E.leverRuleAppliedClosed E.phaseFractionsCalculatedClosed)

end MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
