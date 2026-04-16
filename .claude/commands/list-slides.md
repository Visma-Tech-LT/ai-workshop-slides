List all slides in the current deck order.

Read the `slide-order` file and `slides/` directory, then produce a numbered table:

| # | Filename | Title (from HTML comment or h2) |
|---|----------|---------------------------------|
| 1 | title.html | AI Engineering Workshop |
| … | … | … |

To extract the title: read each slide file, look for the `<h2>` tag content or the HTML comment block at the top (e.g. `<!-- 0 — TITLE -->`). Fall back to the filename if neither is found.

After the table, show a one-line summary: total slide count, and note any files present in `slides/` but missing from `slide-order` (orphaned files).
