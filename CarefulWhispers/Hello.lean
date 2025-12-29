import Mathlib.Tactic

example : 1 + 1 = 2 := by
  simp only [Nat.reduceAdd]

example : 1 * 4 ≤ 33 := by
  simp only [one_mul, Nat.reduceLeDiff]

