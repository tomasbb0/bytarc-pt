# bytarc-pt

Serves bytarc.pt, the Portuguese face of bytarc.com. A scheduled workflow copies the main site
(tomasbb0/tomasbb0.github.io) every 30 minutes and deploys it here, so the site's own language
switch shows Portuguese on bytarc.pt and English on bytarc.com. Pages that only exist on
bytarc.com (the project sites) are sent there by 404.html.

To sync right away: Actions > "Mirror bytarc.com to bytarc.pt" > Run workflow.
