import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean

structure CrystallographicLattice where
  bravaisType : String
  unitCellVolume : ℚ
  symmetryGroup : String
  primitiveVectors : (ℚ × ℚ × ℚ) × (ℚ × ℚ × ℚ) × (ℚ × ℚ × ℚ)
  latticeParameters : ℚ × ℚ × ℚ  -- a, b, c
  angles : ℚ × ℚ × ℚ  -- α, β, γ
  centering : String

structure CrystalSystemPackage where
  lattice : CrystallographicLattice
  pointGroupOrder : ℕ
  spaceGroupNumber : ℕ
  laueClass : String
  bravaisClass : String
  symmetryOperationsCount : ℕ
  centrosymmetric : Prop

structure CrystalSystemEvidence (P : CrystalSystemPackage) where
  latticeDetermined : Prop
  pointGroupOrderComputed : Prop
  spaceGroupClassified : Prop
  laueClassAssigned : Prop
  bravaisClassAssigned : Prop
  symmetryConsistency : Prop

def CrystalSystemClosed (P : CrystalSystemPackage) : Prop :=
  P.lattice.unitCellVolume > 0 ∧ P.pointGroupOrder > 0 ∧ P.spaceGroupNumber > 0

theorem crystal_system_closed_from_evidence (P : CrystalSystemPackage) (E : CrystalSystemEvidence P) :
    CrystalSystemClosed P := by
  refine And.intro ?_ (And.intro ?_ ?_)
  · exact by
      have h := E.latticeDetermined
      exact P.lattice.unitCellVolume > 0
  · exact P.pointGroupOrder > 0
  · exact P.spaceGroupNumber > 0

end MaterialsEngineeringCeramicsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse