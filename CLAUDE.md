# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build

```bash
bash build.sh        # assembles index.html
bash build.sh && open index.html   # build + local preview
```

No dependencies, no package manager. Pure bash + HTML.

## Architecture

This is a zero-dependency HTML slide deck assembled from fragments:

- `_head.html` — shared CSS design system (variables, layout atoms, typography, components)
- `_foot.html` — navigation HTML + JS engine (keyboard/touch/click nav, progress bar)
- `slides/*.html` — one file per slide, each containing a single `<div class="slide">` block
- `slide-order` — manifest that controls slide sequence (one filename per line, no path prefix)
- `build.sh` — reads `slide-order`, concatenates `_head.html` + slides in order + `_foot.html` → `index.html`

`index.html` is the generated output — never edit it directly.

## Slide structure

Each slide file must contain exactly one `<div class="slide" data-i="N">` wrapping a layout div:

- `.center` — vertically and horizontally centered content
- `.left` — left-aligned, vertically centered
- `.split` — two-column layout (`.split-l` + `.split-r`)

CSS classes available from `_head.html`: `.card`, `.card-grid`, `.chip`, `.chip-green/blue/orange/red/purple`, `.eyebrow`, `.code-block`, `.wf` (workflow steps), `.big-stat`, `.dot-grid`, `.bg-glow-green/blue`, `.section-num`.

Color utility classes: `.accent` (green), `.blue`, `.orange`, `.red`, `.dim`.

## Adding or reordering slides

- **Add**: create `slides/<name>.html`, then add the filename to `slide-order` at the desired position.
- **Reorder**: move lines in `slide-order`. No file renaming needed.
- **Skip from nav counter**: add `class="skip-nav"` to the slide div.

## Deployment

Pushing to `main` triggers GitHub Actions (`.github/workflows/deploy.yml`) which runs `bash build.sh` and deploys to GitHub Pages. PRs run the build to validate.
