import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure CPSPlatformPackage where
  physicalProcess : Type
  cyberController : Type
  networkInterface : Type
  timingAssumptions : Prop
  communicationConstraints : Prop

structure CPSPlatformEvidence (P : CPSPlatformPackage) where
  timingAssumptionsClosed : P.timingAssumptions
  communicationConstraintsClosed : P.communicationConstraints

def CPSPlatformClosed (P : CPSPlatformPackage) : Prop :=
  P.timingAssumptions ∧ P.communicationConstraints

theorem cps_platform_closed_from_evidence (P : CPSPlatformPackage) (E : CPSPlatformEvidence P) :
    CPSPlatformClosed P := by
  exact And.intro E.timingAssumptionsClosed E.communicationConstraintsClosed

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse