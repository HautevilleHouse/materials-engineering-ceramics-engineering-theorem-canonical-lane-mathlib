import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean

structure CeramicsPhaseDiagramPackage where
  phaseEquilibrium : Prop
  solidusLiquidus : Prop
  eutecticComposition : Prop
  congruentTransformation : Prop
  metastablePhase : Prop
  tttDiagram : Prop

structure CeramicsPhaseDiagramEvidence (C : CeramicsPhaseDiagramPackage) where
  phaseEquilibriumClosed : C.phaseEquilibrium
  solidusLiquidusClosed : C.solidusLiquidus
  eutecticCompositionClosed : C.eutecticComposition
  congruentTransformationClosed : C.congruentTransformation
  metastablePhaseClosed : C.metastablePhase
  tttDiagramClosed : C.tttDiagram

def CeramicsPhaseDiagramClosed (C : CeramicsPhaseDiagramPackage) : Prop :=
  C.phaseEquilibrium ∧ C.solidusLiquidus ∧ C.eutecticComposition ∧
  C.congruentTransformation ∧ C.metastablePhase ∧ C.tttDiagram

theorem ceramics_phase_diagram_closed_from_evidence
    (C : CeramicsPhaseDiagramPackage) (E : CeramicsPhaseDiagramEvidence C) :
    CeramicsPhaseDiagramClosed C := by
  exact And.intro E.phaseEquilibriumClosed
    (And.intro E.solidusLiquidusClosed
      (And.intro E.eutecticCompositionClosed
        (And.intro E.congruentTransformationClosed
          (And.intro E.metastablePhaseClosed E.tttDiagramClosed))))

end MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
