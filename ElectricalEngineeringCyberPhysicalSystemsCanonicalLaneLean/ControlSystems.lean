import ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure ControlLawPackage (A : AdmissibleClass) where
  stateSpace : Type
  inputSpace : Type
  dynamics : stateSpace → inputSpace → stateSpace
  controlLaw : stateSpace → inputSpace
  stabilityCondition : Prop
  stabilityConditionTerm : stabilityCondition

structure ControlLawEvidence {A : AdmissibleClass} (C : ControlLawPackage A) where
  stabilityConditionClosed : C.stabilityCondition

def ControlLawClosed {A : AdmissibleClass} (C : ControlLawPackage A) : Prop :=
  C.stabilityCondition

theorem control_law_closed_from_evidence {A : AdmissibleClass}
    (C : ControlLawPackage A) (E : ControlLawEvidence C) : ControlLawClosed C := by
  exact E.stabilityConditionClosed

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse