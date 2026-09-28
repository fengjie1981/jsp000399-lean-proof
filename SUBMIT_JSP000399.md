# JSP-000399 — Lean 4 Formalization Submission

## Problem

**JSP-000399** · Can a finite set be uniquely recovered from the multiset of all
sums of a prescribed number of distinct elements?

| Field | Content |
| --- | --- |
| Date proposed | No later than 1961 (bibliographic evidence) |
| Mathematical area | Analysis / Additive combinatorics |
| Problem description | Can a finite set be uniquely recovered from the multiset of all sums of a prescribed number of distinct elements? |
| Current status | Solved |
| Lean proof | No |
| Eligible to claim | No |
| Publication details | [SeSt58] On the determination of numbers by their sums of a fixed order — Pacific J. Math. (1958), 847-856. [GFS62] On the determination of sets by the sets of sums of a certain order — Pacific J. Math. (1962), 187-196. [Er61] Some unsolved problems — Magyar Tud. Akad. Mat. Kutató Int. Közl. (1961), 221-254. [Gu04] Unsolved problems in number theory — (2004), xviii+437. |

## Solution

**Answer: No.** For the prescribed number `k = 2`, the two distinct 4-element sets

- `A = {1, 4, 5, 6}`
- `B = {2, 3, 4, 7}`

have exactly the same multiset of sums of 2 distinct elements:

- `A`: 1+4, 1+5, 1+6, 4+5, 4+6, 5+6  =  {5, 6, 7, 9, 10, 11}
- `B`: 2+3, 2+4, 2+7, 3+4, 3+7, 4+7  =  {5, 6, 7, 9, 10, 11}

yet `A ≠ B`. Hence the set is **not** uniquely determined by that multiset.
This is a classical counterexample (see SeSt58).

## Lean Formalization

- Main theorem: `Jsp000399.jsp000399` in `Jsp000399.lean`.
- Defines `twoSubsetSums (s : Finset ℕ) : Multiset ℕ` =
  the multiset of sums of all 2-element subsets of `s`.
- States
  `∃ (A B : Finset ℕ), A.card = 4 ∧ B.card = 4 ∧ A ≠ B ∧ twoSubsetSums A = twoSubsetSums B`.
- Proof: instantiates `A, B` and closes by `decide`. All data are concrete finite
  sets, so `decide` verifies equality/inequality of the multisets and of the sets.
- No `sorry`, and no `axiom` is used to bypass any proof obligation.

## Build / Reproduction

```
lake clean
lake build
```

- Lean version: **4.34.0**
- mathlib pinned to commit `ba22a8986c7bb38a6f340cc151b98692dc4ce6bf` (v4.34.0 window)

## Files

| File | Description |
| --- | --- |
| `Jsp000399.lean` | Lean 4 proof source (the formalization) |
| `lakefile.toml` | Lake build config (library `Jsp000399`, requires mathlib) |
| `lean-toolchain` | Lean 4.34.0 |
| `lake-manifest.json` | Offline build manifest (locks mathlib + transitive deps) |

## Self-check result

- `lake clean && lake build` → "Build completed successfully", zero `warning`, zero `error`.
- `grep -c sorry Jsp000399.lean` → 0.
- Produces `.lake/build/lib/lean/Jsp000399.olean`.

## Claim (by the human owner only)

This Lean formalization is submitted under the formalizer role. The
claim / identity-verification / USDC payout steps are performed by the
repository owner (the human), not by any agent.
