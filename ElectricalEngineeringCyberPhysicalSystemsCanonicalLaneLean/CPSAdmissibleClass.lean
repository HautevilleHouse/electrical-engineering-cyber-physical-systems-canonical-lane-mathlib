import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure AdmissibleClass where
  systemModel : CyberPhysicalModel
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CyberPhysicalModelClosed A.systemModel ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse