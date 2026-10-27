#!/bin/bash
# Refresh bytarc.pt from the main site (tomasbb0/tomasbb0.github.io, served as bytarc.com) and publish it.
# The page switches itself to Portuguese on bytarc.pt; this copies the files and points the page's own address tags here.
# Run it after publishing a change to the main site: ./sync.sh
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
src="$(mktemp -d)"
trap 'rm -rf "$src"' EXIT
git -C "$here" pull -q --ff-only
git clone -q --depth 1 https://github.com/tomasbb0/tomasbb0.github.io.git "$src"
sha="$(git -C "$src" rev-parse --short HEAD)"
# this repo's own files stay: its domain, 404 (sends project pages to bytarc.com), robots, sitemap, README and this script
rsync -a --delete \
  --exclude=/.git --exclude=/.github --exclude=/.claude \
  --exclude=/CNAME --exclude=/404.html --exclude=/robots.txt --exclude=/sitemap.xml --exclude=/README.md --exclude=/sync.sh \
  "$src"/ "$here"/
sed -i '' \
  -e 's|<html lang="en">|<html lang="pt">|' \
  -e 's|<link rel="canonical" href="https://bytarc.com/*">|<link rel="canonical" href="https://bytarc.pt/">|' \
  -e 's|<meta property="og:url" content="https://bytarc.com/">|<meta property="og:url" content="https://bytarc.pt/">|' \
  -e 's#<title>Bytarc | AI Consulting &amp; Product Development</title>#<title>Bytarc | Consultoria em IA e Desenvolvimento de Produto</title>#' \
  "$here/index.html"
cd "$here"
git add -A
if git diff --cached --quiet; then
  echo "bytarc.pt already matches bytarc.com $sha"
  exit 0
fi
git commit -q -m "Sync with bytarc.com $sha"
git push -q origin main
echo "bytarc.pt updated to bytarc.com $sha"
