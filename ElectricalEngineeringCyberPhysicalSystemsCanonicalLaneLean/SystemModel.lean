import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure SystemModelPackage where
  stateSpace : Type
  inputSpace : Type
  outputSpace : Type
  dynamics : stateSpace → inputSpace → stateSpace
  outputMap : stateSpace → outputSpace
  continuousTime : Prop
  discreteTime : Prop
  timeInvariant : Prop
  wellPosed : Prop

structure SystemModelEvidence (M : SystemModelPackage) where
  continuousTimeClosed : M.continuousTime
  discreteTimeClosed : M.discreteTime
  timeInvariantClosed : M.timeInvariant
  wellPosedClosed : M.wellPosed

def SystemModelClosed (M : SystemModelPackage) : Prop :=
  M.continuousTime ∧ M.discreteTime ∧ M.timeInvariant ∧ M.wellPosed

theorem system_model_closed_from_evidence (M : SystemModelPackage) (E : SystemModelEvidence M) :
    SystemModelClosed M := by
  exact And.intro E.continuousTimeClosed
    (And.intro E.discreteTimeClosed
      (And.intro E.timeInvariantClosed E.wellPosedClosed))

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse