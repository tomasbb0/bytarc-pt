# bytarc-pt

Serves bytarc.pt, the Portuguese face of bytarc.com. It holds a copy of the main site
(tomasbb0/tomasbb0.github.io); the page shows Portuguese on bytarc.pt and English on bytarc.com.
Pages that only exist on bytarc.com (the project sites) are sent there by 404.html.

After publishing a change to the main site, run `./sync.sh` to copy it here. It keeps this repo's
own CNAME, 404.html, robots.txt, sitemap.xml and README, and points the page's canonical tag at bytarc.pt.

(A scheduled GitHub Action did this automatically, but Actions is unavailable on the account right now.)
