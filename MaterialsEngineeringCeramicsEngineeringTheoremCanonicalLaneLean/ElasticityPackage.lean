import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean

structure ElasticityPackage where
  YoungModulus : Float
  ShearModulus : Float
  BulkModulus : Float
  PoissonsRatio : Float
  anisotropicFactors : List Float
  elasticConstants : List (List Float)
  crystalSymmetry : String

structure ElasticityEvidence (E : ElasticityPackage) where
  YoungPositive : E.YoungModulus > 0
  ShearPositive : E.ShearModulus > 0
  BulkPositive : E.BulkModulus > 0
  PoissonRange : -1 < E.PoissonsRatio ∧ E.PoissonsRatio < 0.5
  constantPositivity : ∀ c ∈ E.elasticConstants, ∀ x ∈ c, x > 0

structure ElasticityClosed (E : ElasticityPackage) : Prop := Mk :: evidence : ElasticityEvidence E

theorem elasticity_closed_from_evidence (E : ElasticityPackage) (Ev : ElasticityEvidence E) : ElasticityClosed E := by
  exact { evidence := Ev }

end MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse