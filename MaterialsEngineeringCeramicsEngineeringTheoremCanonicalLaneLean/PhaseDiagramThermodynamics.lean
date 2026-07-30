import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean

structure ThermodynamicPhase where
  phaseName : String
  stableTemperatureRange : ℚ × ℚ
  stablePressureRange : ℚ × ℚ
  gibbsFreeEnergy : ℚ → ℚ → ℚ
  entropy : ℚ → ℚ → ℚ
  enthalpy : ℚ → ℚ → ℚ

structure PhaseDiagramPackage where
  phases : List ThermodynamicPhase
  phaseBoundaries : List ((ThermodynamicPhase × ThermodynamicPhase) × (ℚ × ℚ → Prop))
  eutecticPoint : Option (ℚ × ℚ)
  peritecticPoint : Option (ℚ × ℚ)
  congruentMeltingPoint : Option (ℚ × ℚ)
  solidSolutionRange : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  phasesIdentified : P.phases.length > 0
  boundaryConditionsConsistent : Prop
  eutecticIdentified : P.eutecticPoint.isSome → Prop
  peritecticIdentified : P.peritecticPoint.isSome → Prop
  congruentMeltingIdentified : P.congruentMeltingPoint.isSome → Prop

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.phases.length > 0 ∧ P.solidSolutionRange

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) :
    PhaseDiagramClosed P := by
  exact And.intro E.phasesIdentified P.solidSolutionRange

end MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse