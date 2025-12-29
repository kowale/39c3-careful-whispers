import Mathlib.Tactic

-- stuff between `:` and `:=` is the statement we want to prove
-- `by` means we are entering "tactic mode"
-- everything from then onwards are "tactics"
-- we want to transform assumptions (here there aren't any)
-- until we accomplish all goals
example : 1 + 1 = 2 := by
  simp? -- this is an example of a "search tactic"
        -- press `gf` then `1` then enter to use suggestion

-- here's a lemma (like example above but with a name)
-- that has some assumptions (stuff before `:` from earlier)
lemma α_mul_n_lt_n (n : ℕ) (α : ℝ) (α_le_1 : α < 1) :
  Nat.ceil (α * n) ≤ n := by
    rw [Nat.ceil_le]
    apply mul_le_of_le_one_left
    · simp_all only [Nat.cast_nonneg]
    · exact Std.le_of_lt α_le_1

