import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean

structure CeramicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure CeramicsAdmittedObject where
  space : CeramicsSpace
  polycrystalline : Prop
  grainSize : ℝ
  conclusion : polycrystalline

def CeramicsWitnessClosed (O : CeramicsAdmittedObject) : Prop :=
  O.polycrystalline

end MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
