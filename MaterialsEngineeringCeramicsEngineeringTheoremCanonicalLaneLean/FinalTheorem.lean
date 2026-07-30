import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean

def ConstrainedCeramicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_ceramics_endgame (A : AdmissibleClass) :
    ConstrainedCeramicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
