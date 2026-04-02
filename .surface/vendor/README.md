# VERIFRAX-SURFACE

Source authority for the VERIFRAX public surface system.

## Status

- Role: source authority for form only
- Layer: public surface projection system
- Public host ownership: none
- Runtime ownership: none
- Content authority: none
- Deployment model: projected into host-owning repositories
- License: Apache License 2.0

## What this repository is

VERIFRAX-SURFACE defines the shared surface grammar used by VERIFRAX public-facing hosts.

It exists to provide one controlled source for:

- design tokens
- shell structure
- component primitives
- host-class templates
- host profiles
- projection and validation rules
- anti-drift validation inputs

Its purpose is visual and structural consistency across public surfaces while preserving strict role isolation between hosts.

## What this repository is not

VERIFRAX-SURFACE does not:

- own any public host
- serve production traffic
- define protocol authority
- define runtime behavior
- define proof semantics
- define verification semantics
- define authority issuance semantics
- define intake policy semantics
- define archive semantics
- replace host-repository content authority
- act as a shared runtime dependency

If a host requires this repository to be online in order to render, the integration is wrong.

## Boundary rule

VERIFRAX-SURFACE controls form.

Host-owning repositories control function and content.

This repository may standardize:

- layout discipline
- typographic rhythm
- spacing
- tone envelope
- visual component grammar
- host-class structure
- prohibited surface patterns

This repository may not collapse:

- commercial vs execution
- proof vs verification
- authority vs runtime
- archive vs live proof
- intake vs docs
- status vs product surfaces

## Host classes

The public surface system recognizes exactly three host classes.

### Root / commercial

Used for the commercial root surface.

Current target class:

- `www`

### Tool

Used for active operator or machine-adjacent surfaces.

Current target classes:

- `api`
- `verify`
- `apply`
- `status`

### Reference

Used for bounded reference and publication surfaces.

Current target classes:

- `proof`
- `authority`
- `runtime`
- `enforcement`
- `archive`
- `docs`

## Intended projection targets

VERIFRAX-SURFACE is designed to project into host-owning repositories such as:

- `VERIFRAX`
- `proof`
- `apply`
- `VERIFRAX-verify`
- `AUCTORISEAL`
- `CORPIFORM`
- `cicullis`
- `SIGILLARIUM`
- `VERIFRAX-DOCS`
- status surface source

Projection must always produce committed, inspectable output inside the owning repository.

## Source tree

### `tokens/`

Design tokens and shared constants.

### `shell/`

Global shell rules shared across host classes.

### `components/`

Primitive surface components.

### `templates/`

Host-class templates.

### `host-profiles/`

Host-specific constraints that select and restrict allowed surface behavior.

### `scripts/`

Validation and projection helpers.

## Integration contract

A host-owning repository may consume VERIFRAX-SURFACE only by one of the following methods:

1. checked-in projected output
2. vendored snapshot
3. explicit copy-based projection during controlled authoring

A host-owning repository must not:

- fetch live remote assets from this repository at runtime
- import this repository as a browser dependency
- blur host role boundaries through template misuse
- bypass host profile restrictions

## Required invariants

Every integration must preserve all of the following:

- one host = one exact role
- title, meta description, and body agree on role
- host profile matches actual host purpose
- forbidden neighboring-role language is absent
- canonical adjacent-host links remain correct
- no generic fallback shell overrides role clarity
- no runtime semantics are implied by shared form alone

## Anti-drift objective

The surface system is valid only if it reduces drift without centralizing function.

Drift includes:

- host title mismatch
- stale canonical links
- wrong host-class selection
- copied shell with altered role wording
- proof surface sounding like verifier
- archive sounding like live proof
- authority surface sounding like execution
- commercial surface sounding like protocol runtime

## Related repositories

- `VERIFRAX` — commercial root / flagship system surface owner
- `AUCTORISEAL` — authority surface owner
- `CORPIFORM` — runtime reference surface owner
- `VERIFRAX-verify` — verification surface owner
- `proof` — proof publication surface owner
- `apply` — intake surface owner
- `cicullis` — enforcement reference surface owner
- `SIGILLARIUM` — archive surface owner
- `VERIFRAX-DOCS` — docs surface owner

## Governance posture

This repository must remain mechanically strict.

Changes here are high leverage because they can affect multiple public surfaces at once.

Therefore every change must preserve:

- host-role isolation
- deterministic projection behavior
- stable token semantics
- stable template semantics
- explicit host-profile constraints

## Minimal acceptance rule

VERIFRAX-SURFACE is acceptable only when:

- it is useful as a source system
- it is not required as live infrastructure
- it cannot silently cause boundary collapse
- every projected host remains classifiable in under three seconds

## License

Apache License 2.0
