import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean

structure SinteringPackage where
  densification : Prop
  grainGrowth : Prop
  poreRemoval : Prop
  sinteringKinetics : Prop
  solidStateSintering : Prop
  liquidPhaseSintering : Prop
  hotPressing : Prop

structure SinteringEvidence (S : SinteringPackage) where
  densificationClosed : S.densification
  grainGrowthClosed : S.grainGrowth
  poreRemovalClosed : S.poreRemoval
  sinteringKineticsClosed : S.sinteringKinetics
  solidStateSinteringClosed : S.solidStateSintering
  liquidPhaseSinteringClosed : S.liquidPhaseSintering
  hotPressingClosed : S.hotPressing

def SinteringClosed (S : SinteringPackage) : Prop :=
  S.densification ∧ S.grainGrowth ∧ S.poreRemoval ∧
  S.sinteringKinetics ∧ S.solidStateSintering ∧ S.liquidPhaseSintering ∧ S.hotPressing

theorem sintering_closed_from_evidence (S : SinteringPackage) (E : SinteringEvidence S) : SinteringClosed S := by
  exact And.intro E.densificationClosed
    (And.intro E.grainGrowthClosed
      (And.intro E.poreRemovalClosed
        (And.intro E.sinteringKineticsClosed
          (And.intro E.solidStateSinteringClosed
            (And.intro E.liquidPhaseSinteringClosed E.hotPressingClosed)))))

end MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse