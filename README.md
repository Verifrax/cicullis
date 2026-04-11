# CICULLIS

Deterministic CI merge-gate and enforcement surface for the Verifrax perimeter.

## Terminal planes

- **[ANAGNORIUM](https://github.com/Verifrax/ANAGNORIUM)** — terminal recognition
- **[REGRESSORIUM](https://github.com/Verifrax/REGRESSORIUM)** — terminal recourse

## Status

- Repository role: CI enforcement and GitHub Action surface only
- npm package: `@verifrax/cicullis@0.1.0`
- Action surface: `Verifrax/cicullis@v1`
- Public host ownership: none
- Repository class: governed enforcement surface
- License: Apache License 2.0

## One-sentence role

CICULLIS enforces merge-time policy invariants deterministically without becoming protocol authority, execution runtime, proof publisher, or evidence-root registry.

## What this repository is

CICULLIS is the bounded enforcement surface of the stack.

It exists to provide:

- deterministic merge gating
- stable failure-code contracts
- GitHub Action integration for enforcement
- pre-merge policy blocking
- forward-only CI boundary enforcement

## What this repository is not

CICULLIS is not:

- the authority layer
- the execution runtime
- the proof publication surface
- the evidence-root registry
- the verifier UI
- a warning-only policy linter
- an advisory scanner
- a substitute for branch protection

## Public package and action contract

Public npm package:

- `@verifrax/cicullis@0.1.0`

Public action surface:

- `Verifrax/cicullis@v1`

These are enforcement distribution surfaces only. They do not grant authority, publish receipts, or register chain truth.

## Stack position

- `AUCTORISEAL` defines authority
- `CORPIFORM` performs governed execution
- `cicullis` blocks non-compliant change before merge
- `VERIFRAX` records evidence-root chain truth

## License

Apache License 2.0

## Adjacent sovereign surfaces

This repository is part of the Verifrax sovereign stack and remains bounded relative to:

- **[ANAGNORIUM](https://github.com/Verifrax/ANAGNORIUM)** for terminal recognition
- **[REGRESSORIUM](https://github.com/Verifrax/REGRESSORIUM)** for terminal recourse
