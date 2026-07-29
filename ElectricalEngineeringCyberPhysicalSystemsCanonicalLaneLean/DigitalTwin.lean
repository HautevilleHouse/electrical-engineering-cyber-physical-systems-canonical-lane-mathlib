import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure DigitalTwinPackage (P : CPSPlatformPackage) (C : ControlSystemPackage P) (N : NetworkedCPSPackage P C) (S : SafetyBarrierPackage P C N) where
  twinModel : Type
  synchronization : Prop
  estimationAccuracy : Prop
  anomalyDetection : Prop

structure DigitalTwinEvidence {P : CPSPlatformPackage} {C : ControlSystemPackage P} {N : NetworkedCPSPackage P C} {S : SafetyBarrierPackage P C N} (D : DigitalTwinPackage P C N S) where
  synchronizationClosed : D.synchronization
  estimationAccuracyClosed : D.estimationAccuracy
  anomalyDetectionClosed : D.anomalyDetection

def DigitalTwinClosed {P : CPSPlatformPackage} {C : ControlSystemPackage P} {N : NetworkedCPSPackage P C} {S : SafetyBarrierPackage P C N} (D : DigitalTwinPackage P C N S) : Prop :=
  D.synchronization ∧ D.estimationAccuracy ∧ D.anomalyDetection

theorem digital_twin_closed_from_evidence {P : CPSPlatformPackage} {C : ControlSystemPackage P} {N : NetworkedCPSPackage P C} {S : SafetyBarrierPackage P C N} (D : DigitalTwinPackage P C N S) (E : DigitalTwinEvidence D) :
    DigitalTwinClosed D := by
  exact And.intro E.synchronizationClosed (And.intro E.estimationAccuracyClosed E.anomalyDetectionClosed)

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse