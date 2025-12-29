import Lake
open Lake DSL

package "CarefulWhispers" where
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩, -- λ
    ⟨`autoImplicit, false⟩, -- implicit variables, bad
    ⟨`relaxedAutoImplicit, false⟩, -- same for greek letters
    ⟨`linter.style.longLine, true⟩,
    ⟨`linter.unusedTactic, true⟩,
    ⟨`linter.unusedVariables, true⟩]

@[default_target]
lean_lib «CarefulWhispers»

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.26.0"

