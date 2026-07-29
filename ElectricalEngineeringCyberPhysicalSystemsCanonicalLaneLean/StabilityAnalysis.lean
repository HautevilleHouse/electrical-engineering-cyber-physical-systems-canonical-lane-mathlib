import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure StabilityPackage {C : CyberPhysicalSystemPackage} {L : ControlLoopPackage C} where
  lyapunovFunction : C.plant → ℝ
  lyapunovDerivative : Prop
  positiveDefinite : Prop
  decreasingAlongTrajectories : Prop
  stabilityMargin : ℝ

structure StabilityEvidence {C : CyberPhysicalSystemPackage} {L : ControlLoopPackage C}
    (S : StabilityPackage C L) where
  lyapunovDerivativeClosed : S.lyapunovDerivative
  positiveDefiniteClosed : S.positiveDefinite
  decreasingAlongTrajectoriesClosed : S.decreasingAlongTrajectories

def StabilityClosed {C : CyberPhysicalSystemPackage} {L : ControlLoopPackage C}
    (S : StabilityPackage C L) : Prop :=
  S.lyapunovDerivative ∧ S.positiveDefinite ∧ S.decreasingAlongTrajectories

theorem stability_closed_from_evidence {C : CyberPhysicalSystemPackage}
    {L : ControlLoopPackage C} (S : StabilityPackage C L)
    (E : StabilityEvidence S) : StabilityClosed S := by
  exact And.intro E.lyapunovDerivativeClosed
    (And.intro E.positiveDefiniteClosed E.decreasingAlongTrajectoriesClosed)

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse