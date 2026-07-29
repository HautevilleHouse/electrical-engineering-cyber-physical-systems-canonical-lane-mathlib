import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure TimingConstraintsPackage where
  deadline : ℝ
  jitterBounds : ℝ
  networkLatency : ℝ
  computationTime : ℝ
  schedulabilityProof : Prop
  endToEndDelayProof : Prop

structure TimingConstraintsEvidence (T : TimingConstraintsPackage) where
  schedulabilityClosed : T.schedulabilityProof
  endToEndDelayClosed : T.endToEndDelayProof

def TimingConstraintsClosed (T : TimingConstraintsPackage) : Prop :=
  T.schedulabilityProof ∧ T.endToEndDelayProof

theorem timing_constraints_closed_from_evidence (T : TimingConstraintsPackage)
    (E : TimingConstraintsEvidence T) : TimingConstraintsClosed T := by
  exact And.intro E.schedulabilityClosed E.endToEndDelayClosed

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse