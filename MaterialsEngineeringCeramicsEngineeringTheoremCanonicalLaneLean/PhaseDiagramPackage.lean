import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean

structure PhaseDiagramPackage where
  components : List String
  phases : List String
  equilibriumLines : List (String × String × Float)
  eutecticPoint : Option (String × Float)
  peritecticPoint : Option (String × Float)
  solidSolution : Bool
  temperatureRange : (Float × Float)
  pressureRange : (Float × Float)

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  componentsNonempty : P.components.length ≥ 2
  phasesNonempty : P.phases.length ≥ 1
  equilibriumLinesNonempty : P.equilibriumLines.length ≥ 1
  temperatureValid : P.temperatureRange.1 < P.temperatureRange.2
  pressureValid : P.pressureRange.1 < P.pressureRange.2

structure PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop := Mk :: evidence : PhaseDiagramEvidence P

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact { evidence := E }

end MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse