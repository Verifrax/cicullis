# Authoritative Index

## This repository

CICULLIS is the **authoritative source** for:
- CI gate execution logic
- Policy profile definitions
- Failure code contracts
- Primitive orchestration

## Authoritative files

| File | Authority |
|------|-----------|
| `gate.sh` | Entry point and execution |
| `engine/*.sh` | Primitive executors |
| `profiles/*.profile` | Policy definitions |
| `FAILURE_CODES.json` | Exit code contract |
| `PROFILE_SCHEMA.json` | Profile structure |
| `INVARIANTS.md` | Guaranteed properties |

## Related systems

| System | Relationship |
|--------|--------------|
| MK10-PRO | Upstream policy definitions |
| VERIFRAX | Downstream certificate issuance |
| Primitives | Execution targets |

## Non-authoritative

- README prose
- Examples
- Test fixtures (illustrative only)

## Verification

```bash
# Verify profile checksum
cat .profile_checksum
sha256sum profiles/default.profile
```
