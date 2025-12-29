import Mathlib.Tactic

example : 1 + 1 = 2 := by
  simp only [Nat.reduceAdd]

example : 1 * 4 ≤ 33 := by
  simp only [one_mul, Nat.reduceLeDiff]

lemma α_mul_n_lt_n (n : ℕ) (α : ℝ) (α_le_1 : α < 1) : ⌈(α * n)⌉ ≤ n := by
  sorry

