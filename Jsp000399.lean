import Mathlib.Data.Finset.Basic
import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Multiset.Basic
import Mathlib.Tactic

/-!
# JSP-000399 — Can a finite set be uniquely recovered from the multiset of all
# sums of a prescribed number of distinct elements?
#
# Answer: **No.** For the prescribed number `k = 2`, the two distinct
# 4-element sets
#   A = {1, 4, 5, 6}
#   B = {2, 3, 4, 7}
# have exactly the same multiset of sums of 2 distinct elements:
#   A: 1+4, 1+5, 1+6, 4+5, 4+6, 5+6  = {5,6,7,9,10,11}
#   B: 2+3, 2+4, 2+7, 3+4, 3+7, 4+7  = {5,6,7,9,10,11}
# yet A ≠ B. Hence the set is not uniquely determined by that multiset.
-/

namespace Jsp000399

/-- The multiset of sums of all 2-element subsets of a finite set of naturals. -/
def twoSubsetSums (s : Finset ℕ) : Multiset ℕ :=
  Multiset.map (fun (t : Finset ℕ) => t.val.sum)
    ((s.powerset).filter (fun t => t.card = 2)).val

theorem jsp000399 :
    ∃ (A B : Finset ℕ), A.card = 4 ∧ B.card = 4 ∧ A ≠ B ∧
      twoSubsetSums A = twoSubsetSums B := by
  use {1,4,5,6}, {2,3,4,7}
  refine ⟨?_, ?_, ?_, ?_⟩
  · decide
  · decide
  · decide
  · decide

end Jsp000399
