import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean

structure ElasticStiffnessTensor where
  components : ℚ × ℚ × ℚ × ℚ × ℚ × ℚ
  symmetryConditions : Prop
  positiveDefiniteness : Prop
  crystallographicSymmetry : String

structure ElasticityPackage where
  stiffnessTensor : ElasticStiffnessTensor
  complianceTensor : ElasticStiffnessTensor
  youngModulus : ℚ
  shearModulus : ℚ
  poissonRatio : ℚ
  bulkModulus : ℚ
  elasticAnisotropyFactor : ℚ

structure ElasticityEvidence (E : ElasticityPackage) where
  stiffnessDetermined : E.stiffnessTensor.symmetryConditions
  complianceDetermined : E.complianceTensor.symmetryConditions
  moduliPositive : E.youngModulus > 0 ∧ E.shearModulus > 0 ∧ E.bulkModulus > 0
  poissonRatioInRange : -1 < E.poissonRatio ∧ E.poissonRatio < 0.5
  anisotropyComputed : E.elasticAnisotropyFactor > 0

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.youngModulus > 0 ∧ E.shearModulus > 0 ∧ E.bulkModulus > 0 ∧
  (-1 < E.poissonRatio ∧ E.poissonRatio < 0.5) ∧ E.elasticAnisotropyFactor > 0

theorem elasticity_closed_from_evidence (E : ElasticityPackage) (Ev : ElasticityEvidence E) :
    ElasticityClosed E := by
  rcases Ev.moduliPositive with ⟨hY, hS, hB⟩
  rcases Ev.poissonRatioInRange with ⟨hP1, hP2⟩
  exact And.intro hY (And.intro hS (And.intro hB (And.intro (And.intro hP1 hP2) Ev.anisotropyComputed)))

end MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse