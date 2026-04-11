#!/usr/bin/env python3
import json
import html
import sys
from pathlib import Path

ROOT_COPY = {
    "root": "Canonical public entry for the VERIFRAX system.",
    "tool": "Bounded public tool surface inside the VERIFRAX perimeter.",
    "reference": "Canonical bounded reference surface inside the VERIFRAX perimeter."
}

CLASS_RULES = {
    "root": [
        "Navigation belongs here; execution does not.",
        "Commercial or root framing may exist; authority, verification, proof publication, runtime and intake semantics may not collapse into this host.",
        "One public root. Many isolated surfaces."
    ],
    "tool": [
        "One host. One active function.",
        "Tool surfaces may expose operator or machine-adjacent affordances without claiming adjacent-host authority.",
        "Execution, verification, intake, and status are not interchangeable."
    ],
    "reference": [
        "Reference surfaces explain, publish, or preserve bounded material.",
        "Reference is not execution. Reference is not authority issuance.",
        "Archive, proof, docs, runtime reference, and enforcement reference stay distinct."
    ]
}

READING_ORDER = [
    ("Docs", "https://docs.verifrax.net"),
    ("Proof", "https://proof.verifrax.net"),
    ("Verify", "https://verify.verifrax.net"),
    ("Authority", "https://auctoriseal.verifrax.net"),
    ("Runtime", "https://corpiform.verifrax.net"),
    ("Enforcement", "https://cicullis.verifrax.net"),
    ("Archive", "https://sigillarium.verifrax.net"),
    ("Apply", "https://apply.verifrax.net"),
    ("Status", "https://status.verifrax.net"),
]

def escape(s):
    return html.escape(str(s), quote=True)

def ensure_asset(dest_dir: Path, css: str):
    asset_dir = dest_dir / "assets"
    asset_dir.mkdir(parents=True, exist_ok=True)
    (asset_dir / "surface.css").write_text(css, encoding="utf-8")

def render(cfg, surface_sha):
    host = cfg["host"]
    host_class = cfg["hostClass"]
    title = cfg["title"]
    repo = cfg["repo"]
    repo_url = f"https://github.com/Verifrax/{repo}"
    description = cfg["description"]
    role = cfg["role"]
    deploy_mode = cfg["deployMode"]
    adjacent = cfg.get("adjacentHosts", {})
    adjacent_rows = "\n".join(
        f'<li class="row"><span class="label">{escape(label)}</span><span class="value"><a href="{escape(url)}">{escape(url.replace("https://", ""))}</a></span></li>'
        for label, url in adjacent.items()
    )
    rules = "\n".join(f"<li>{escape(item)}</li>" for item in CLASS_RULES[host_class])
    reading = "\n".join(f'<a class="pill" href="{escape(url)}">{escape(label)}</a>' for label, url in READING_ORDER)
    deploy_note = "Static public host." if deploy_mode == "static-root" else "Preview-only surface projection. Live host stays outside GitHub Pages."
    return f"""<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>{escape(title)}</title>
  <meta name="description" content="{escape(description)}">
  <link rel="canonical" href="{escape(host if host.endswith("/") else host + "/")}">
  <link rel="stylesheet" href="assets/surface.css">
</head>
<body>
  <main class="wrap">
    <div class="kicker">VERIFRAX / {escape(role)}</div>
    <h1>{escape(title)}</h1>
    <p class="lead">{escape(description)}</p>
    <p class="copy">{escape(ROOT_COPY[host_class])}</p>
    <div class="rule"></div>

    <section class="grid two">
      <article class="card">
        <h2>System map</h2>
        <ul class="list">
          {adjacent_rows}
        </ul>
      </article>

      <article class="card">
        <h2>Host contract</h2>
        <p>{escape(deploy_note)}</p>
        <ul>
          {rules}
        </ul>
      </article>
    </section>

    <section class="card" style="margin-top:28px">
      <h2>Surface authority</h2>
      <ul class="list">
        <li class="row"><span class="label">Host</span><span class="value"><code>{escape(host)}</code></span></li>
        <li class="row"><span class="label">Repository</span><span class="value"><a href="{escape(repo_url)}">{escape(repo)}</a></span></li>
        <li class="row"><span class="label">Host class</span><span class="value"><code>{escape(host_class)}</code></span></li>
        <li class="row"><span class="label">Surface role</span><span class="value"><code>{escape(role)}</code></span></li>
        <li class="row"><span class="label">Projection source</span><span class="value"><code>VERIFRAX-SURFACE@{escape(surface_sha[:12])}</code></span></li>
      </ul>
      <p class="note">Form comes from the surface authority. Host purpose and content stay owned by the host repository.</p>
    </section>

    <section class="card" style="margin-top:28px">
      <h2>Reading order</h2>
      <div class="pills">{reading}</div>
    </section>

    <div class="footer">
      Generated from <code>surface.host.json</code> by the vendored VERIFRAX-SURFACE projector.
    </div>
  </main>
</body>
</html>
"""

def main():
    repo_root = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else Path.cwd()
    cfg_path = repo_root / "surface.host.json"
    if not cfg_path.exists():
        raise SystemExit(f"missing config: {cfg_path}")
    cfg = json.loads(cfg_path.read_text(encoding="utf-8"))
    surface_sha = (repo_root / ".surface" / "SURFACE_SHA").read_text(encoding="utf-8").strip() if (repo_root / ".surface" / "SURFACE_SHA").exists() else "unknown"

    shell_css = (repo_root / ".surface" / "vendor" / "shell" / "base.css").read_text(encoding="utf-8")
    tokens_css = (repo_root / ".surface" / "vendor" / "tokens" / "surface.css").read_text(encoding="utf-8")
    css = tokens_css + "\n\n" + shell_css

    if cfg["deployMode"] == "static-root":
        out_dir = repo_root
    else:
        out_dir = repo_root / "surface-preview"

    out_dir.mkdir(parents=True, exist_ok=True)
    ensure_asset(out_dir, css)
    html_doc = render(cfg, surface_sha)
    (out_dir / "index.html").write_text(html_doc, encoding="utf-8")
    (out_dir / "404.html").write_text(html_doc.replace("<h1>", "<h1>404 — ", 1), encoding="utf-8")

if __name__ == "__main__":
    main()
