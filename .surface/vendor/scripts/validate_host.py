#!/usr/bin/env python3
from __future__ import annotations
import json
import sys
from pathlib import Path

FORBIDDEN = {
    "www": ["execution surface", "authority issuance", "proof publication", "verification runtime"],
    "api": ["proof publication", "authority issuance", "applicant intake", "marketing homepage"],
    "verify": ["proof publication surface", "authority issuance surface"],
    "proof": ["verification ui", "governed execution"],
    "authority": ["proof publication", "public verifier"],
    "docs": ["authority issuance", "runtime execution"],
    "apply": ["proof publication", "execution runtime"],
    "status": ["proof publication", "authority issuance"],
    "archive": ["live proof execution", "verification execution"],
    "cicullis": ["marketing homepage", "proof publication", "applicant intake"],
}

SELF_KEYS = {
    "title",
    "name",
    "headline",
    "eyebrow",
    "kicker",
    "description",
    "summary",
    "tagline",
    "purpose",
    "mission",
    "scope",
    "boundary",
    "surface_name",
    "surface_title",
    "surface_description",
}

IGNORE_KEYS = {
    "adjacent",
    "navigation",
    "nav",
    "links",
    "routes",
    "surfaces",
    "destinations",
    "footer_links",
    "header_links",
}

def norm(s: str) -> str:
    return " ".join(s.lower().split())

def collect_self_strings(node, out: list[str], parent_key: str | None = None):
    if isinstance(node, dict):
        for k, v in node.items():
            lk = str(k).lower()
            if lk in IGNORE_KEYS:
                continue
            if lk in SELF_KEYS:
                if isinstance(v, str):
                    out.append(v)
                elif isinstance(v, list):
                    for item in v:
                        if isinstance(item, str):
                            out.append(item)
                elif isinstance(v, dict):
                    collect_self_strings(v, out, lk)
            else:
                collect_self_strings(v, out, lk)
    elif isinstance(node, list):
        for item in node:
            collect_self_strings(item, out, parent_key)

def main():
    path = Path(sys.argv[1] if len(sys.argv) > 1 else "surface.host.json")
    data = json.loads(path.read_text(encoding="utf-8"))

    role = (
        data.get("role")
        or data.get("host")
        or data.get("surface")
        or ""
    ).strip().lower()

    if not role:
        raise SystemExit("missing role/host in surface.host.json")

    forbidden = FORBIDDEN.get(role, [])
    corpus_parts: list[str] = []
    collect_self_strings(data, corpus_parts)
    corpus = norm(" ".join(corpus_parts))

    hits = [term for term in forbidden if norm(term) in corpus]
    if hits:
        raise SystemExit(f"forbidden terms for role {role}: {hits}")

    print(f"ok: {role}")

if __name__ == "__main__":
    main()
