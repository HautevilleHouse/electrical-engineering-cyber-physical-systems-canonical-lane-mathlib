import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure NetworkedCPSPackage (P : CPSPlatformPackage) (C : ControlSystemPackage P) where
  networkTopology : Type
  communicationDelay : Prop
  packetLossModel : Prop
  consensusProtocol : Prop

structure NetworkedCPSEvidence {P : CPSPlatformPackage} {C : ControlSystemPackage P} (N : NetworkedCPSPackage P C) where
  communicationDelayClosed : N.communicationDelay
  packetLossModelClosed : N.packetLossModel
  consensusProtocolClosed : N.consensusProtocol

def NetworkedCPSClosed {P : CPSPlatformPackage} {C : ControlSystemPackage P} (N : NetworkedCPSPackage P C) : Prop :=
  N.communicationDelay ∧ N.packetLossModel ∧ N.consensusProtocol

theorem networked_cps_closed_from_evidence {P : CPSPlatformPackage} {C : ControlSystemPackage P} (N : NetworkedCPSPackage P C) (E : NetworkedCPSEvidence N) :
    NetworkedCPSClosed N := by
  exact And.intro E.communicationDelayClosed (And.intro E.packetLossModelClosed E.consensusProtocolClosed)

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse