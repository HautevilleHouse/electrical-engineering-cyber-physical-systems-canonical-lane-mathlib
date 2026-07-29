import canonicalLaneMathlib.AdmissibleClass
import ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean.SystemModel

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure ControlSpecificationPackage {M : SystemModelPackage} where
  stabilityMargin : Prop
  settlingTime : Prop
  steadyStateError : Prop
  robustPerformance : Prop

structure ControlSpecificationEvidence {M : SystemModelPackage} (C : ControlSpecificationPackage M) where
  stabilityMarginClosed : C.stabilityMargin
  settlingTimeClosed : C.settlingTime
  steadyStateErrorClosed : C.steadyStateError
  robustPerformanceClosed : C.robustPerformance

def ControlSpecificationClosed {M : SystemModelPackage} (C : ControlSpecificationPackage M) : Prop :=
  C.stabilityMargin ∧ C.settlingTime ∧ C.steadyStateError ∧ C.robustPerformance

theorem control_specification_closed_from_evidence {M : SystemModelPackage} (C : ControlSpecificationPackage M) (E : ControlSpecificationEvidence C) :
    ControlSpecificationClosed C := by
  exact And.intro E.stabilityMarginClosed
    (And.intro E.settlingTimeClosed
      (And.intro E.steadyStateErrorClosed E.robustPerformanceClosed))

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse