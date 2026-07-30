import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean

structure ElasticConstants where
  youngModulus : Prop
  poissonRatio : Prop
  shearModulus : Prop
  bulkModulus : Prop

structure ElasticityPackage where
  constants : ElasticConstants
  stressStrainRelation : Prop
  hookesLawValid : Prop
  elasticEnergyDensity : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  stressStrainRelationClosed : E.stressStrainRelation
  hookesLawValidClosed : E.hookesLawValid
  elasticEnergyDensityClosed : E.elasticEnergyDensity

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.stressStrainRelation ∧ E.hookesLawValid ∧ E.elasticEnergyDensity

theorem elasticity_closed_from_evidence (E : ElasticityPackage) (Ev : ElasticityEvidence E) :
    ElasticityClosed E := by
  exact And.intro Ev.stressStrainRelationClosed
    (And.intro Ev.hookesLawValidClosed Ev.elasticEnergyDensityClosed)

end MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
