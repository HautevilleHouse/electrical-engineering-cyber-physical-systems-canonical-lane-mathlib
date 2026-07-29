import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure SafetyBarrierPackage (P : CPSPlatformPackage) (C : ControlSystemPackage P) (N : NetworkedCPSPackage P C) where
  barrierFunction : Type
  safetySet : Prop
  barrierCondition : Prop
  forwardInvariance : Prop

structure SafetyBarrierEvidence {P : CPSPlatformPackage} {C : ControlSystemPackage P} {N : NetworkedCPSPackage P C} (S : SafetyBarrierPackage P C N) where
  safetySetClosed : S.safetySet
  barrierConditionClosed : S.barrierCondition
  forwardInvarianceClosed : S.forwardInvariance

def SafetyBarrierClosed {P : CPSPlatformPackage} {C : ControlSystemPackage P} {N : NetworkedCPSPackage P C} (S : SafetyBarrierPackage P C N) : Prop :=
  S.safetySet ∧ S.barrierCondition ∧ S.forwardInvariance

theorem safety_barrier_closed_from_evidence {P : CPSPlatformPackage} {C : ControlSystemPackage P} {N : NetworkedCPSPackage P C} (S : SafetyBarrierPackage P C N) (E : SafetyBarrierEvidence S) :
    SafetyBarrierClosed S := by
  exact And.intro E.safetySetClosed (And.intro E.barrierConditionClosed E.forwardInvarianceClosed)

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse