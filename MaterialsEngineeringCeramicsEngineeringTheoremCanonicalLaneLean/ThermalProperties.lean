import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean

structure ThermalParameters where
  thermalConductivity : Prop
  thermalExpansion : Prop
  specificHeat : Prop

structure ThermalPropertiesPackage where
  parameters : ThermalParameters
  heatConductionModel : Prop
  thermalStressAnalysis : Prop
  thermalShockResistance : Prop

structure ThermalPropertiesEvidence (T : ThermalPropertiesPackage) where
  heatConductionModelClosed : T.heatConductionModel
  thermalStressAnalysisClosed : T.thermalStressAnalysis
  thermalShockResistanceClosed : T.thermalShockResistance

def ThermalPropertiesClosed (T : ThermalPropertiesPackage) : Prop :=
  T.heatConductionModel ∧ T.thermalStressAnalysis ∧ T.thermalShockResistance

theorem thermal_properties_closed_from_evidence (T : ThermalPropertiesPackage) (E : ThermalPropertiesEvidence T) :
    ThermalPropertiesClosed T := by
  exact And.intro E.heatConductionModelClosed
    (And.intro E.thermalStressAnalysisClosed E.thermalShockResistanceClosed)

end MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
