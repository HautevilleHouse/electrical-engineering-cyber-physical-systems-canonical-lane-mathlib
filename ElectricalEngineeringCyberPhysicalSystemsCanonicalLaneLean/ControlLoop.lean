import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure ControlLoopPackage (C : CyberPhysicalSystemPackage) where
  referenceSignal : C.plant → C.plant
  feedbackGain : Prop
  closedLoopDynamics : Prop
  trackingError : Prop
  boundedInput : Prop

structure ControlLoopEvidence {C : CyberPhysicalSystemPackage} (L : ControlLoopPackage C) where
  feedbackGainClosed : L.feedbackGain
  closedLoopDynamicsClosed : L.closedLoopDynamics
  trackingErrorClosed : L.trackingError
  boundedInputClosed : L.boundedInput

def ControlLoopClosed {C : CyberPhysicalSystemPackage} (L : ControlLoopPackage C) : Prop :=
  L.feedbackGain ∧ L.closedLoopDynamics ∧ L.trackingError ∧ L.boundedInput

theorem control_loop_closed_from_evidence {C : CyberPhysicalSystemPackage}
    (L : ControlLoopPackage C) (E : ControlLoopEvidence L) : ControlLoopClosed L := by
  exact And.intro E.feedbackGainClosed
    (And.intro E.closedLoopDynamicsClosed
      (And.intro E.trackingErrorClosed E.boundedInputClosed))

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse