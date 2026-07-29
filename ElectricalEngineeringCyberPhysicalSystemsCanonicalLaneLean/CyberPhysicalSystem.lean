import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean

structure CyberPhysicalSystemPackage where
  plant : Type u
  controller : Type v
  sensor : Type w
  actuator : Type x
  network : Type y
  continuousDynamics : Prop
  discreteEvents : Prop
  interactionConsistent : Prop

structure CyberPhysicalSystemEvidence (C : CyberPhysicalSystemPackage) where
  continuousDynamicsClosed : C.continuousDynamics
  discreteEventsClosed : C.discreteEvents
  interactionConsistentClosed : C.interactionConsistent

def CyberPhysicalSystemClosed (C : CyberPhysicalSystemPackage) : Prop :=
  C.continuousDynamics ∧ C.discreteEvents ∧ C.interactionConsistent

theorem cyber_physical_system_closed_from_evidence (C : CyberPhysicalSystemPackage)
    (E : CyberPhysicalSystemEvidence C) : CyberPhysicalSystemClosed C := by
  exact And.intro E.continuousDynamicsClosed
    (And.intro E.discreteEventsClosed E.interactionConsistentClosed)

end ElectricalEngineeringCyberPhysicalSystemsCanonicalLaneLean
end HautevilleHouse