import ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CPSWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact And.intro A.object.safetyConditionTerm A.object.livenessConditionTerm

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse