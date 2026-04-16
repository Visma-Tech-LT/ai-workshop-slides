# AI Engineering Workshop — Slides

Collaborative slide deck for the Visma AI Engineering Workshop (April 2026).

## Structure

```
_head.html        ← shared CSS, fonts, layout
_foot.html        ← nav HTML + JS engine
slides/
  01-title.html
  02-agenda.html
  ...             ← one file per slide
  23-retro.html
build.sh          ← assembles index.html from the above
```

## Editing slides

1. Open the relevant file in `slides/`
2. Edit the `<div class="slide">` block
3. Run `bash build.sh` locally to preview (`open index.html`)
4. Open a PR — CI will validate the build

## Adding a new slide

1. Create `slides/NN-your-slide-name.html` — the number determines position
2. Copy the structure from a nearby slide (same layout class: `center`, `left`, or `split`)
3. Run `bash build.sh` to verify it renders
4. Open a PR

## Reordering slides

Rename the files so the leading numbers reflect the new order, then rebuild.

## Local preview

```bash
bash build.sh && open index.html
```

## Deployment

Merging to `main` triggers GitHub Actions which builds and deploys to GitHub Pages automatically.
