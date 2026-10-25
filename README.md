# bytarc-pt

Serves bytarc.pt, the Portuguese face of bytarc.com. It holds a copy of the main site
(tomasbb0/tomasbb0.github.io); the site's own language switch shows Portuguese on bytarc.pt
and English on bytarc.com. Pages that only exist on bytarc.com (the project sites) are sent there
by 404.html.

The copy is refreshed automatically by tools/sync_bytarc_pt.sh in the main repo, which its
pre-push hook runs every time main is published. Run that script by hand to sync at any time.
