import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean

structure SinteringStage where
  stageName : String
  temperature : ℚ
  time : ℚ
  densityFraction : ℚ
  grainSize : ℚ

structure SinteringModelPackage where
  initialDensity : ℚ
  finalDensity : ℚ
  sinteringTemperature : ℚ
  holdingTime : ℚ
  activationEnergy : ℚ
  diffusionCoefficient : ℚ
  grainGrowthExponent : ℚ
  densificationRateEquation : ℚ → ℚ → ℚ
  stages : List SinteringStage

structure SinteringEvidence (S : SinteringModelPackage) where
  densityIncrease : S.finalDensity > S.initialDensity
  temperaturePositive : S.sinteringTemperature > 0
  holdingTimePositive : S.holdingTime > 0
  activationEnergyPositive : S.activationEnergy > 0
  diffusionCoefficientPositive : S.diffusionCoefficient > 0
  grainGrowthExponentPositive : S.grainGrowthExponent > 0
  stagesSequential : S.stages.length ≥ 1

def SinteringClosed (S : SinteringModelPackage) : Prop :=
  S.finalDensity > S.initialDensity ∧ S.sinteringTemperature > 0 ∧ S.holdingTime > 0 ∧
  S.activationEnergy > 0 ∧ S.diffusionCoefficient > 0 ∧ S.grainGrowthExponent > 0 ∧ S.stages.length ≥ 1

theorem sintering_closed_from_evidence (S : SinteringModelPackage) (E : SinteringEvidence S) :
    SinteringClosed S := by
  exact And.intro E.densityIncrease (And.intro E.temperaturePositive (And.intro E.holdingTimePositive
    (And.intro E.activationEnergyPositive (And.intro E.diffusionCoefficientPositive
      (And.intro E.grainGrowthExponentPositive E.stagesSequential)))))

end MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse