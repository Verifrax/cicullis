# Security Policy

## Scope

CICULLIS is a deterministic CI enforcement action.

It does **not**:
- process secrets or credentials
- make outbound network requests
- transmit data externally
- modify repository contents
- execute user-defined commands

All behavior is local, explicit, and observable.

---

## Data Handling

CICULLIS operates only on:
- repository state
- commit metadata
- explicit profile input
- local append-only ledgers

No data leaves the GitHub Actions execution environment.

---

## Threat Model

CICULLIS is designed to:
- fail closed
- reject ambiguity
- prevent silent bypass
- avoid non-deterministic behavior

There is no dynamic configuration surface and no runtime mutation.

---

## Supported Versions

Only the latest **major version** is supported.

- Supported: `v1`
- Unsupported: prior major versions

Security fixes, if any, will be released as patch versions under the current major tag.

---

## Reporting a Vulnerability

Report security issues **privately** via GitHub Security Advisories.

Do **not** open public issues for security-sensitive reports.

There is no SLA, warranty, or implied guarantee.

---

## Responsibility Boundary

CICULLIS enforces decisions.  
It does not assume responsibility for outcomes.

Operators remain accountable for:
- configuration choices
- workflow design
- downstream effects of enforcement

Use implies acceptance of this boundary.
