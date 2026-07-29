import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure ControlSystemPackage where
  stateSpace : Type u
  inputSpace : Type v
  outputSpace : Type w
  dynamics : stateSpace → inputSpace → stateSpace
  controllerLaw : stateSpace → outputSpace → inputSpace
  stabilityProof : Prop
  performanceBounds : Prop

structure ControlSystemEvidence (C : ControlSystemPackage) where
  dynamicsWellDefined : C.stabilityProof
  performanceBoundsClosed : C.performanceBounds

def ControlSystemClosed (C : ControlSystemPackage) : Prop :=
  C.stabilityProof ∧ C.performanceBounds

theorem control_system_closed_from_evidence (C : ControlSystemPackage)
    (E : ControlSystemEvidence C) : ControlSystemClosed C := by
  exact And.intro E.dynamicsWellDefined E.performanceBoundsClosed

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse