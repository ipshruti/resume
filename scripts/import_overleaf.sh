#!/usr/bin/env bash
# Copy the LaTeX sources from an Overleaf "Download Source" zip into this repo.
# Usage: pixi run import [path/to/overleaf.zip]
# With no argument, uses the newest Shruti_Priya_Resume*.zip in ~/Downloads.
set -euo pipefail

repo="$(cd "$(dirname "$0")/.." && pwd)"
zip="${1:-$(ls -t "$HOME"/Downloads/Shruti_Priya_Resume*.zip 2>/dev/null | head -n 1 || true)}"

if [[ -z "$zip" || ! -f "$zip" ]]; then
  echo "No Overleaf zip found. Download it from Overleaf (Menu > Download > Source) or pass a path." >&2
  exit 1
fi

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
unzip -q -o "$zip" -d "$tmp"

# Only the LaTeX sources; README/LICENSE/template images in the zip are Overleaf template boilerplate.
cp "$tmp"/resume.tex "$tmp"/_header.tex "$tmp"/TLCresume.sty "$repo"/
mkdir -p "$repo/sections"
cp "$tmp"/sections/*.tex "$repo/sections/"

echo "Imported sources from: $zip"
git -C "$repo" status --short -- '*.tex' '*.sty'
