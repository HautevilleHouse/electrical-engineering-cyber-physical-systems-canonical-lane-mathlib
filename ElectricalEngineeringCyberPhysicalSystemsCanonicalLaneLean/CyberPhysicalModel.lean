import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure CyberPhysicalModel where
  physicalPlant : PhysicalDynamicsPackage
  controller : ControlSystemPackage
  network : CommunicationNetwork
  timingConstraints : TimingConstraintsPackage
  safetySpec : SafetyVerificationPackage
  conclusion : Prop

structure CyberPhysicalModelEvidence (M : CyberPhysicalModel) where
  physicalPlantClosed : PhysicalDynamicsClosed M.physicalPlant
  controllerClosed : ControlSystemClosed M.controller
  networkClosed : CommunicationNetworkClosed M.network
  timingClosed : TimingConstraintsClosed M.timingConstraints
  safetyClosed : SafetyVerificationClosed M.safetySpec

def CyberPhysicalModelClosed (M : CyberPhysicalModel) : Prop :=
  PhysicalDynamicsClosed M.physicalPlant ∧ ControlSystemClosed M.controller ∧
  CommunicationNetworkClosed M.network ∧ TimingConstraintsClosed M.timingConstraints ∧
  SafetyVerificationClosed M.safetySpec

theorem cyber_physical_model_closed_from_evidence (M : CyberPhysicalModel)
    (E : CyberPhysicalModelEvidence M) : CyberPhysicalModelClosed M := by
  exact And.intro E.physicalPlantClosed (
    And.intro E.controllerClosed (
      And.intro E.networkClosed (
        And.intro E.timingClosed E.safetyClosed)))

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse