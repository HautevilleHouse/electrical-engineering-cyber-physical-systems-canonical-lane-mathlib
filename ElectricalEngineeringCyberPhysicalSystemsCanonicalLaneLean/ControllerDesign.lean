import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean.CyberPhysicalModel

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure ControllerDesignPackage (M : CPSModel) where
  controlLaw : Prop
  stabilityProof : Prop
  robustnessMargins : Prop
  actuatorConstraints : Prop
  realTimeImplementation : Prop

structure ControllerDesignEvidence {M : CPSModel} (C : ControllerDesignPackage M) where
  controlLawClosed : C.controlLaw
  stabilityProofClosed : C.stabilityProof
  robustnessMarginsClosed : C.robustnessMargins
  actuatorConstraintsClosed : C.actuatorConstraints
  realTimeImplementationClosed : C.realTimeImplementation

def ControllerDesignClosed {M : CPSModel} (C : ControllerDesignPackage M) : Prop :=
  C.controlLaw ∧ C.stabilityProof ∧ C.robustnessMargins ∧
  C.actuatorConstraints ∧ C.realTimeImplementation

theorem controller_design_closed_from_evidence {M : CPSModel} (C : ControllerDesignPackage M)
    (E : ControllerDesignEvidence C) : ControllerDesignClosed C := by
  exact And.intro E.controlLawClosed
    (And.intro E.stabilityProofClosed
      (And.intro E.robustnessMarginsClosed
        (And.intro E.actuatorConstraintsClosed E.realTimeImplementationClosed)))

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse