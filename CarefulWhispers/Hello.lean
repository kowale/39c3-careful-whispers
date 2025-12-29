import Mathlib.Tactic

lemma ceil_one_α_mul_n_one_le_n_one (α : ℝ) (hα : α < 1 ∧ 0 < α) (n : ℕ) :
  ⌈(1-α)*(n+1)⌉ ≤ n+1 := by
    obtain ⟨α_lt_1, α_gt_0⟩ := hα
    rw [Int.ceil_le]
    apply mul_le_of_le_one_of_le_of_nonneg
    · exact le_of_lt (by exact sub_lt_self 1 α_gt_0)
    · simp
    · norm_cast
      simp

