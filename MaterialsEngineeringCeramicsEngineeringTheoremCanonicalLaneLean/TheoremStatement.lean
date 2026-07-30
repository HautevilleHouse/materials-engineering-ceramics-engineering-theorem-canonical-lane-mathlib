import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean

structure CeramicsAdmittedObject where
  crystalStructure : Type
  phaseDiagram : Prop
  elasticConstants : Prop
  fractureToughness : Prop
  conclusion : Prop

structure CeramicsEndgameState where
  object : CeramicsAdmittedObject

def CeramicsWitnessClosed (O : CeramicsAdmittedObject) : Prop :=
  O.conclusion

end MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse