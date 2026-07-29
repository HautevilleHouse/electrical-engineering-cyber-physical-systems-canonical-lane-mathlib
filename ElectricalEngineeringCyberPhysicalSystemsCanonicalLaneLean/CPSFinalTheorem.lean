import PSBridgeLemmas

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

def ConstrainedCPSClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_cps_endgame (A : AdmissibleClass) :
    ConstrainedCPSClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse