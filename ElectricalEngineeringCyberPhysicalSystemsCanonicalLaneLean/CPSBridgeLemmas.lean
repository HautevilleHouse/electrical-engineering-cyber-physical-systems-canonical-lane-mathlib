import canonicalLaneMathlib.AdmissibleClass
import CPSAdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CyberPhysicalModelClosed A.systemModel

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.systemModel.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse