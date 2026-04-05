# CICULLIS

![License](https://img.shields.io/badge/license-Apache--2.0-blue)
![Role](https://img.shields.io/badge/role-enforcement%20surface-111111)
![Identity](https://github.com/Verifrax/cicullis/actions/workflows/identity.yml/badge.svg?branch=main)
![Determinism](https://github.com/Verifrax/cicullis/actions/workflows/determinism-check.yml/badge.svg?branch=main)
![Integrity](https://github.com/Verifrax/cicullis/actions/workflows/integrity.yml/badge.svg?branch=main)
![Deploy](https://github.com/Verifrax/cicullis/actions/workflows/pages.yml/badge.svg?branch=main)
![Host](https://img.shields.io/badge/host-cicullis.verifrax.net-1f6feb)

Deterministic enforcement repository for `cicullis.verifrax.net`, responsible for the enforcement boundary of the Verifrax perimeter by turning declared repository and workflow rules into binary CI outcomes without becoming protocol authorship, authority issuance, governed runtime execution, proof publication, public verification tooling, archive publication, intake processing, or evidence-root chain registration.

## Status

* Repository role: enforcement boundary only
* Public host ownership: `cicullis.verifrax.net`
* Surface class: enforcement reference and CI action surface
* npm package: `@verifrax/cicullis@0.1.0`
* Stack position: enforcement boundary adjacent to governed repositories and workflow gates
* Authority relation: consumes governance and authority-linked rules; does not issue authority
* Artifact relation: must stay aligned with the artifact-0005 boundary without claiming to author, execute, verify, or register artifact-0005 itself
* License: Apache License Version 2.0

## One-sentence role

`cicullis` is the Verifrax enforcement-boundary repository and public reference surface for deterministic merge and workflow blocking rules, making repository policy executable at CI time without turning enforcement into upstream protocol authorship, authority issuance, runtime execution, or proof verification.

## What this repository is

This repository is the enforcement boundary.

Its job is to make certain classes of repository and workflow rules binary instead of advisory.

That means this repository exists to support surfaces such as:

* deterministic CI enforcement
* merge-gate behavior
* policy-to-failure conversion
* repository-boundary blocking rules
* enforcement documentation
* action usage where that usage is real and maintained
* public explanation of what the enforcement surface does and does not do

This repository should let a reader answer:

* what gets blocked
* where enforcement sits in the stack
* what enforcement depends on
* what enforcement does not decide
* how enforcement relates to governance, authority, execution, and verification

## What this repository is not

This repository is not:

* `VERIFRAX`
* `AUCTORISEAL`
* `CORPIFORM`
* `VERIFRAX-SPEC`
* `VERIFRAX-verify`
* `proof`
* `SIGILLARIUM`
* `apply`
* `VERIFRAX-DOCS`
* `ARCHITECTURE`

It is not:

* the authored protocol source
* the authority issuer
* the governed execution runtime
* the public verifier
* the proof publication surface
* the archive surface
* the intake surface
* the evidence-root chain registry
* a generic vulnerability scanner
* a linter marketed as enforcement
* a narrative policy repository with no executable consequence

It must not claim to:

* decide truth
* issue authority
* verify proofs as the verifier surface
* execute governed runtime receipts
* publish artifact-0005 as the evidence root of record
* replace repository-specific semantics with generic enforcement theater

Enforcement is not authority.
Enforcement is not runtime.
Enforcement is not proof verification.
Enforcement is not protocol authorship.

## Why this repository exists

Documentation-only governance fails at the first adversarial branch.

A limiting case makes that obvious:

If a rule exists only in prose, then the first unchecked workflow can ignore it.
If a merge gate can warn instead of terminate, then the rule is optional in practice.
If a repo can say “must” while CI still permits the opposite, the real rule is whatever CI allowed.

This repository exists to close that gap.

`cicullis` converts selected repository rules into executable refusal.

## Position in the Verifrax system

The load-bearing split is:

* [`.github`](https://github.com/Verifrax/.github) — organization governance perimeter
* [`VERIFRAX`](https://github.com/Verifrax/VERIFRAX) — authored source and evidence-root chain context
* [`AUCTORISEAL`](https://github.com/Verifrax/AUCTORISEAL) — authority issuance and authority reference
* [`CORPIFORM`](https://github.com/Verifrax/CORPIFORM) — governed execution and receipt boundary
* [`VERIFRAX-SPEC`](https://github.com/Verifrax/VERIFRAX-SPEC) — derived specification publication
* [`VERIFRAX-verify`](https://github.com/Verifrax/VERIFRAX-verify) — public verifier surface
* [`proof`](https://github.com/Verifrax/proof) — public proof publication
* [`SIGILLARIUM`](https://github.com/Verifrax/SIGILLARIUM) — archive and seal reference
* [`apply`](https://github.com/Verifrax/apply) — intake surface
* [`cicullis`](https://github.com/Verifrax/cicullis) — enforcement boundary

The precise role of `cicullis` is to sit at the enforcement layer, consuming declared rules and turning them into pass/fail CI outcomes.

## Public host ownership

This repository owns:

* `https://cicullis.verifrax.net/`

That host should remain an enforcement reference surface only.

It must not become:

* `https://api.verifrax.net/`
* `https://proof.verifrax.net/`
* `https://auctoriseal.verifrax.net/`
* `https://corpiform.verifrax.net/`
* `https://verify.verifrax.net/`
* `https://sigillarium.verifrax.net/`
* `https://apply.verifrax.net/`
* `https://docs.verifrax.net/`
* `https://status.verifrax.net/`

And it must not render:

* the commercial landing body
* the proof body
* the verifier body
* the authority body
* the runtime execution body
* the archive body
* the intake body

If two hosts say the same thing, one of them is lying about its role.

## Enforcement boundary

The enforcement surface is responsible for turning declared constraints into binary outcomes.

Typical classes include:

* repository identity checks
* required-file checks
* policy-surface checks
* immutability and branch-discipline checks
* truth-surface consistency checks
* failure-on-drift rules
* refusal on missing required surfaces

The important constraint is not breadth.
It is consequence.

A rule enforced here should either pass or terminate.
Not warn.
Not suggest.
Not defer.

## What CICULLIS does not decide

`cicullis` does not decide:

* whether protocol claims are true
* whether authority is valid as the authority issuer of record
* whether governed runtime execution should occur
* whether a proof is semantically valid under verifier rules
* whether an archived artifact should be considered canonical history

Those belong elsewhere.

A strong negative case matters here:

If `cicullis` started issuing authority, `AUCTORISEAL` would no longer be the authority layer.
If `cicullis` started producing receipts, `CORPIFORM` would no longer be the execution boundary.
If `cicullis` started verifying proof semantics, `VERIFRAX` or `VERIFRAX-verify` would lose their role clarity.

So this repo must remain hard-bounded.

## Relationship to governance

`cicullis` consumes governance-facing rules.
It does not author governance truth at the org boundary.

The relationship is:

* `.github` defines the organization-governance perimeter
* `AUCTORISEAL` defines authority issuance and authority reference
* governed repositories declare their own bounded truth surfaces
* `cicullis` enforces selected repository and workflow constraints against those declared boundaries

That is the correct direction.
Not the reverse.

## Relationship to artifact-0005

This repository must remain aligned with artifact-0005 because enforcement drift can damage the seal perimeter indirectly.

But its role is limited:

* `cicullis` does not author artifact-0005
* `cicullis` does not issue the artifact-0005 authority object
* `cicullis` does not execute the governed artifact-0005 runtime path
* `cicullis` does not verify artifact-0005 as the public verifier surface
* `cicullis` does not register artifact-0005 in the evidence root

What it does do is support the perimeter by making policy refusal executable where enforcement is intended.

That is a real dependency, but a bounded one.

## Inputs and outputs

### Inputs

This repository consumes declared policy, repository surfaces, workflow conditions, and enforcement-target material.

### Outputs

This repository emits enforcement outcomes only, such as:

* pass/fail gate results
* workflow termination
* deterministic refusal where configured
* enforcement-surface documentation

It does not emit:

* authority objects
* governed execution receipts
* proof artifacts
* archive catalogs
* intake submissions
* evidence-root artifact registration

## Reading order

A reader should not start here to understand protocol semantics.

A useful reading order is:

1. `.github` — governance perimeter
2. `VERIFRAX` — authored source and evidence-root chain context
3. `AUCTORISEAL` — authority layer
4. `CORPIFORM` — governed execution layer
5. `cicullis` — enforcement boundary
6. outward surfaces by role: `proof`, `VERIFRAX-verify`, `SIGILLARIUM`, `apply`

If a reader tries to learn authored protocol semantics from `cicullis`, they are already one layer too late.

## Action and CI posture

If this repository exposes a GitHub Action or workflow-consumable enforcement surface, that surface must be described mechanically, not theatrically.

That means the README should stay aligned with real execution behavior such as:

* what inputs are consumed
* what failure classes exist
* what blocks execution
* what repository surfaces are checked
* what conditions terminate a run

It must not rely on inflated claims like “final,” “authoritative,” or “production” unless the exact boundary for those words is mechanically provable.

Enforcement language without executable scope is noise.

## What problem a reader should solve here

A reader should land here to answer questions like:

* what is the enforcement boundary in the Verifrax perimeter?
* what kinds of rules become binary here?
* what public host owns the enforcement surface?
* how is this different from governance, authority, execution, and verification?
* does this repository block or merely describe?

A reader should not land here expecting:

* proof inspection
* verifier UI behavior
* execution receipts
* authority object issuance
* intake submission flow
* archive browsing

## CI and determinism expectations

A repository that claims enforcement should not live on rhetoric alone.

At minimum, the enforcement surface should remain compatible with:

* deterministic behavior for the same inputs
* explicit refusal semantics
* visible boundary between rule definition and rule execution
* no advisory-mode language unless advisory mode actually exists
* no “passes” claim if the repository only documents policy and enforces nothing

If enforcement can be bypassed trivially, it is not an enforcement boundary.

## Neighboring surfaces it must reference correctly

This repository should preserve correct links and separations with:

* [`.github`](https://github.com/Verifrax/.github)
* [`VERIFRAX`](https://github.com/Verifrax/VERIFRAX)
* [`AUCTORISEAL`](https://github.com/Verifrax/AUCTORISEAL)
* [`CORPIFORM`](https://github.com/Verifrax/CORPIFORM)
* [`VERIFRAX-SPEC`](https://github.com/Verifrax/VERIFRAX-SPEC)
* [`VERIFRAX-verify`](https://github.com/Verifrax/VERIFRAX-verify)
* [`proof`](https://github.com/Verifrax/proof)
* [`SIGILLARIUM`](https://github.com/Verifrax/SIGILLARIUM)
* [`apply`](https://github.com/Verifrax/apply)

But it must not blur those links into role duplication.

## Reader contract

A reader should be able to answer these immediately:

1. Is this the enforcement boundary? Yes.
2. Does it own `cicullis.verifrax.net`? Yes.
3. Does it issue authority? No.
4. Does it execute governed receipts? No.
5. Does it verify proofs as the verifier surface? No.
6. Does it publish proofs? No.
7. Does it archive seals? No.
8. Does it need to stay aligned with artifact-0005? Yes.

If those answers are not obvious, the README is still too weak.

## Host ownership lock

This repository must be the sole owning repository for `cicullis.verifrax.net`.

No other repository may claim sole ownership of that host.

This repository does not own:

* the execution surface
* the proof publication surface
* the verifier surface
* the intake surface
* the archive surface
* the evidence-root registry

## Verifrax system path labels

The governed Verifrax path that this README must stay compatible with is:

1. `.github` — organization governance and governed repository boundary
2. `AUCTORISEAL` — authority issuance and public authority reference
3. `CORPIFORM` — governed execution and receipt emission
4. `VERIFRAX` — authored protocol, evidence root, and artifact-chain registration boundary
5. `VERIFRAX-SPEC` — derived specification publication surface
6. `VERIFRAX-PROFILES` — deterministic profile-constraint surface
7. `VERIFRAX-SAMPLES` — pinned sample and reproducibility surface
8. `VERIFRAX-verify` — public verification repository and UI boundary
9. `VERIFRAX-DOCS` — explanatory documentation surface
10. `cicullis` — enforcement boundary
11. `proof` — proof publication surface
12. `SIGILLARIUM` — seal and archive reference surface
13. `apply` — intake surface

The live host-label map that must remain explicit and non-contradictory is:

* `https://api.verifrax.net/` — execution surface
* `https://proof.verifrax.net/` — proof publication surface
* `https://auctoriseal.verifrax.net/` — authority issuance and authority reference surface
* `https://corpiform.verifrax.net/` — runtime and receipt reference surface
* `https://cicullis.verifrax.net/` — enforcement reference surface
* `https://verify.verifrax.net/` — public verification surface
* `https://sigillarium.verifrax.net/` — seal and archive reference surface
* `https://apply.verifrax.net/` — intake surface
* `https://docs.verifrax.net/` — documentation surface

This README must remain compatible with `artifact-0005` as the load-bearing authority → execution → verification → evidence boundary without claiming that this repository alone authors, proves, seals, or registers `artifact-0005` unless that role is actually true for this repository.

## Security

Treat enforcement bypass, false-pass conditions, and rule-scope ambiguity as security-relevant defects.

Do not use public issues for sensitive findings if a private reporting route exists.

An enforcement repository with ambiguous failure behavior is more dangerous than a clearly passive repository, because it invites trust it may not deserve.

## Contributing

A contribution here is wrong if it:

* makes `cicullis` sound like the protocol source
* makes `cicullis` sound like the authority issuer
* makes `cicullis` sound like the governed runtime
* makes `cicullis` sound like the proof or verifier surface
* introduces fake finality language
* introduces host ambiguity
* weakens the enforcement-only boundary
* implies artifact-0005 authorship or registration
* leaves the repo sounding like a generic policy essay instead of an enforcement boundary

## License

Apache License Version 2.0. See `LICENSE`.
