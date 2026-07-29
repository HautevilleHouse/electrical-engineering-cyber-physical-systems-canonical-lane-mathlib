import canonicalLaneMathlib.AdmissibleClass
import ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean.SystemModel

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure NetworkEstimationPackage {M : SystemModelPackage} where
  sensorFusion : Prop
  kalmanFilterConvergence : Prop
  communicationConstraints : Prop
  estimationErrorBounded : Prop
  delayCompensation : Prop

structure NetworkEstimationEvidence {M : SystemModelPackage} (N : NetworkEstimationPackage M) where
  sensorFusionClosed : N.sensorFusion
  kalmanFilterConvergenceClosed : N.kalmanFilterConvergence
  communicationConstraintsClosed : N.communicationConstraints
  estimationErrorBoundedClosed : N.estimationErrorBounded
  delayCompensationClosed : N.delayCompensation

def NetworkEstimationClosed {M : SystemModelPackage} (N : NetworkEstimationPackage M) : Prop :=
  N.sensorFusion ∧ N.kalmanFilterConvergence ∧ N.communicationConstraints ∧
  N.estimationErrorBounded ∧ N.delayCompensation

theorem network_estimation_closed_from_evidence {M : SystemModelPackage} (N : NetworkEstimationPackage M) (E : NetworkEstimationEvidence N) :
    NetworkEstimationClosed N := by
  exact And.intro E.sensorFusionClosed
    (And.intro E.kalmanFilterConvergenceClosed
      (And.intro E.communicationConstraintsClosed
        (And.intro E.estimationErrorBoundedClosed E.delayCompensationClosed)))

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse