import canonicalLaneMathlib.AdmissibleClass
import ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean.SystemModel

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure SecurityResiliencePackage {M : SystemModelPackage} where
  attackDetection : Prop
  secureEstimation : Prop
  resilientControl : Prop
  faultTolerance : Prop
  availability : Prop

structure SecurityResilienceEvidence {M : SystemModelPackage} (S : SecurityResiliencePackage M) where
  attackDetectionClosed : S.attackDetection
  secureEstimationClosed : S.secureEstimation
  resilientControlClosed : S.resilientControl
  faultToleranceClosed : S.faultTolerance
  availabilityClosed : S.availability

def SecurityResilienceClosed {M : SystemModelPackage} (S : SecurityResiliencePackage M) : Prop :=
  S.attackDetection ∧ S.secureEstimation ∧ S.resilientControl ∧
  S.faultTolerance ∧ S.availability

theorem security_resilience_closed_from_evidence {M : SystemModelPackage} (S : SecurityResiliencePackage M) (E : SecurityResilienceEvidence S) :
    SecurityResilienceClosed S := by
  exact And.intro E.attackDetectionClosed
    (And.intro E.secureEstimationClosed
      (And.intro E.resilientControlClosed
        (And.intro E.faultToleranceClosed E.availabilityClosed)))

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse