# CICULLIS

**CICULLIS** is a GitHub Action that enforces **irreversible contracts at CI time**.

It is a **binary gate**.
It does not warn.
It does not suggest.
It **blocks**.

If CICULLIS passes, the decision is closed.
If it fails, nothing moves forward.

---

## What CICULLIS Is

* A **CI choke point**
* A **deterministic enforcement engine**
* A **forward‑only decision gate**
* A mechanism to encode **finality, custody, provenance, and judgment**

CICULLIS runs automatically in CI and exits **pass / fail** only.

---

## What CICULLIS Is Not

* Not a linter
* Not a policy suggestion tool
* Not a report generator
* Not configurable per rule
* Not interactive

There is no "warn" mode.
There is no silent bypass.

---

## How It Works

On every CI run, CICULLIS executes a fixed enforcement pipeline:

1. **Time boundary** is evaluated
2. **Custody** is required
3. **Provenance** is sealed
4. **Boundaries** are closed
5. **Verification** is deterministic
6. **Attestation** is recorded
7. **Judgment** is final

Any violation causes an immediate CI failure.

---

## Installation

Add one step to your workflow:

```yaml
- uses: midiakiasat/cicullis@v1
```

No configuration is required.

---

## Profiles

CICULLIS behavior is defined by a **profile**.

By default, CICULLIS runs with:

```
profiles/default.profile
```

Profiles are **strict**, **explicit**, and **forward‑only**.

There is no per‑rule toggle.
If a rule exists, it is enforced.

---

## Failure Model

When CICULLIS fails, CI output contains:

* the violated rule
* the affected artifact
* the closed decision

Example:

```
CI-GATE FAILED
Rule: PROVENANCE.SEAL.MISSING
Decision: BLOCKED
```

No retries.
No overrides.

---

## Versioning

CICULLIS follows semantic versioning.

* Behavior is stable within a major version
* Breaking changes require a major bump
* Old versions remain valid

Pin versions to guarantee behavior.

---

## License

MIT License.

Use freely.
Fork freely.

Responsibility for outcomes remains with the operator.

---

## Intended Use

CICULLIS is designed for teams that:

* require **final decisions**
* cannot tolerate silent regression
* operate under audit, compliance, or risk pressure
* want enforcement, not advice

If you need flexibility, CICULLIS is not for you.

---

## Support

CICULLIS is free to use.

Support, assurance, incident response, and custom profiles are **out of band**.

When CICULLIS blocks something important, someone must decide.

That is the point.
