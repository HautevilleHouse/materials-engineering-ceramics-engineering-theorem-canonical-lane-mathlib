import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean

structure SinteringParameters where
  temperature : Prop
  pressure : Prop
  particleSize : Prop
  time : Prop

structure SinteringPackage where
  parameters : SinteringParameters
  densificationModel : Prop
  grainGrowthModel : Prop
  poreRemovalVerified : Prop

structure SinteringEvidence (S : SinteringPackage) where
  densificationModelClosed : S.densificationModel
  grainGrowthModelClosed : S.grainGrowthModel
  poreRemovalVerifiedClosed : S.poreRemovalVerified

def SinteringClosed (S : SinteringPackage) : Prop :=
  S.densificationModel ∧ S.grainGrowthModel ∧ S.poreRemovalVerified

theorem sintering_closed_from_evidence (S : SinteringPackage) (E : SinteringEvidence S) :
    SinteringClosed S := by
  exact And.intro E.densificationModelClosed
    (And.intro E.grainGrowthModelClosed E.poreRemovalVerifiedClosed)

end MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
