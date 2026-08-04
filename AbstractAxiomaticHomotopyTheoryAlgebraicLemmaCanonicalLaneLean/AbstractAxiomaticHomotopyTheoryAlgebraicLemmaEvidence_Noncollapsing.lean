import canonicalLaneMathlib.AdmissibleClass

/-!
# Abstract Axiomatic Homotopy Theory Algebraic Lemma

This file records the evidence layers for the algebraic lemma
in an abstract axiomatic homotopy theory.  The three layers are:

1.  algebraic exactness — exactness of induced long exact sequences;
2.  algebraic gluing — invariance of homotopy pushouts and pullbacks;
3.  algebraic coherence — coherence of the model structure in the
    admissible class.
-/

namespace HautevilleHouse
namespace AbstractAxiomaticHomotopyTheoryAlgebraicLemmaCanonicalLaneLean

open canonicalLaneMathlib

universe u

variable {𝒞 : Type u} [AdmissibleClass 𝒞]

/-- The package of algebraic lemma hypotheses for an abstract
    axiomatic homotopy theory. -/
structure AlgebraicLemmaPackage where
  algebraic_exactness : Prop
  algebraic_gluing : Prop
  algebraic_coherence : Prop

/-- The evidence that each hypothesis in the algebraic lemma package
    is satisfied. -/
structure AlgebraicLemmaEvidence (P : AlgebraicLemmaPackage) where
  algebraic_exactness_closed : P.algebraic_exactness
  algebraic_gluing_closed : P.algebraic_gluing
  algebraic_coherence_closed : P.algebraic_coherence

/-- The closed statement of the algebraic lemma: all three layers hold. -/
def AlgebraicLemmaClosed (P : AlgebraicLemmaPackage) : Prop :=
  P.algebraic_exactness ∧ P.algebraic_gluing ∧ P.algebraic_coherence

/-- The algebraic lemma is established whenever evidence for each
    of its three components is provided. -/
theorem algebraic_lemma_closed_from_evidence
    (P : AlgebraicLemmaPackage) (E : AlgebraicLemmaEvidence P) :
    AlgebraicLemmaClosed P := by
  exact And.intro E.algebraic_exactness_closed
    (And.intro E.algebraic_gluing_closed E.algebraic_coherence_closed)

end AbstractAxiomaticHomotopyTheoryAlgebraicLemmaCanonicalLaneLean
end HautevilleHouse