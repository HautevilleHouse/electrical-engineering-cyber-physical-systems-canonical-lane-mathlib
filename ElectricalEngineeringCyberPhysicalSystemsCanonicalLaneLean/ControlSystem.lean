import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure ControlSystemPackage (P : CPSPlatformPackage) where
  stateSpace : Type
  inputSpace : Type
  dynamics : P.physicalProcess → P.cyberController → Prop
  stabilityCondition : Prop
  reachabilityCondition : Prop

structure ControlSystemEvidence {P : CPSPlatformPackage} (C : ControlSystemPackage P) where
  dynamicsClosed : C.dynamics = C.dynamics
  stabilityConditionClosed : C.stabilityCondition
  reachabilityConditionClosed : C.reachabilityCondition

def ControlSystemClosed {P : CPSPlatformPackage} (C : ControlSystemPackage P) : Prop :=
  C.stabilityCondition ∧ C.reachabilityCondition

theorem control_system_closed_from_evidence {P : CPSPlatformPackage} (C : ControlSystemPackage P) (E : ControlSystemEvidence C) :
    ControlSystemClosed C := by
  exact And.intro E.stabilityConditionClosed E.reachabilityConditionClosed

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse