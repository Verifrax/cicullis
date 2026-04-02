# INTEGRATION_RULES

## Purpose

These rules define how host-owning repositories consume VERIFRAX-SURFACE.

## Source authority

VERIFRAX-SURFACE is source authority for form only.

Host-owning repositories remain source authority for:
- function
- content
- deployment
- host routing
- protocol-specific semantics

## Allowed integration methods

A host-owning repository may consume VERIFRAX-SURFACE only by:

1. checked-in projected output
2. vendored snapshot
3. controlled copy-based projection during authoring

## Forbidden integration methods

A host-owning repository must not:

- fetch CSS or templates from VERIFRAX-SURFACE at runtime
- require VERIFRAX-SURFACE availability in production
- use live remote browser imports from VERIFRAX-SURFACE
- bypass host profiles
- modify shared shell structure without explicit local justification
- change role language while claiming shared surface compliance

## Required invariants

Every projected host must preserve all of the following:

- exact host role
- correct host class
- title/meta/body agreement
- hard boundary statement
- canonical adjacency links
- no forbidden neighboring-role language
- no runtime dependency on VERIFRAX-SURFACE

## Host classes

### root
- www only

### tool
- api
- verify
- apply
- status

### reference
- proof
- authority
- runtime
- enforcement
- archive
- docs

## Projection rule

Projection must result in committed output inside the host-owning repository.

The projected output must be inspectable in git diff.

## Validation rule

Each consuming repository should expose a local validation step that checks:

- host profile selection
- title/meta/body role agreement
- forbidden language absence
- shell marker presence
- canonical adjacent links

## Drift rule

A host is in drift if any of the following occur:

- copied shell changed without profile justification
- title differs from role statement
- docs host sounds like commercial root
- proof host sounds like verifier
- authority host sounds like runtime
- archive host sounds like live proof
- status host contains marketing prose

## Release rule

Surface-system updates should be versioned and projected deliberately.

No host should silently change appearance or structure through hidden dependency updates.
