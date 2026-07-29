import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean.CyberPhysicalModel

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure StateEstimationPackage (M : CPSModel) where
  observerDesign : Prop
  convergenceGuarantee : Prop
  noiseHandling : Prop
  observabilityCondition : Prop
  implementation : Prop

structure StateEstimationEvidence {M : CPSModel} (S : StateEstimationPackage M) where
  observerDesignClosed : S.observerDesign
  convergenceGuaranteeClosed : S.convergenceGuarantee
  noiseHandlingClosed : S.noiseHandling
  observabilityConditionClosed : S.observabilityCondition
  implementationClosed : S.implementation

def StateEstimationClosed {M : CPSModel} (S : StateEstimationPackage M) : Prop :=
  S.observerDesign ∧ S.convergenceGuarantee ∧ S.noiseHandling ∧
  S.observabilityCondition ∧ S.implementation

theorem state_estimation_closed_from_evidence {M : CPSModel} (S : StateEstimationPackage M)
    (E : StateEstimationEvidence S) : StateEstimationClosed S := by
  exact And.intro E.observerDesignClosed
    (And.intro E.convergenceGuaranteeClosed
      (And.intro E.noiseHandlingClosed
        (And.intro E.observabilityConditionClosed E.implementationClosed)))

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse