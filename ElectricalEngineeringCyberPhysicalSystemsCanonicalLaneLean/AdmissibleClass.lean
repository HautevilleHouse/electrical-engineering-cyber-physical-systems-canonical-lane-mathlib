import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure CPSAdmittedObject where
  systemModel : Type
  controllerSpec : Prop
  physicalDynamics : Prop
  networkTopology : Prop
  safetyCondition : Prop
  livenessCondition : Prop
  safetyConditionTerm : safetyCondition
  livenessConditionTerm : livenessCondition

def CPSWitnessClosed (O : CPSAdmittedObject) : Prop :=
  O.safetyCondition ∧ O.livenessCondition

structure AdmissibleClass where
  object : CPSAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CPSWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse