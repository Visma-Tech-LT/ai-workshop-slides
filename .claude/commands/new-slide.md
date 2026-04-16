Create a new slide in this deck.

Arguments: $ARGUMENTS

Expected input (flexible):
- Just a name: `intro-mcp`
- Name + position after another slide: `intro-mcp after:hooks`
- Name + absolute position: `intro-mcp at:5`
- Name + end: `intro-mcp` (default — appended before `retro.html`)

## Steps

1. **Parse** the slide name and optional position from $ARGUMENTS.
   - Normalize the name: lowercase, hyphens only, no `.html` extension needed from user.
   - Final filename will be `slides/<name>.html`.

2. **Determine position** in `slide-order`:
   - `after:<slide>` → insert the line after the named slide's line
   - `at:<N>` → insert at line N (1-based)
   - No position → append as second-to-last line (before `retro.html`)

3. **Ask the user** which layout they want before creating the file:
   - `center` — vertically/horizontally centered, good for section dividers and stats
   - `left` — left-aligned bullet content, most common for theory slides
   - `split` — two-column, good for code + explanation pairs

4. **Create `slides/<name>.html`** using the correct boilerplate below.

5. **Update `slide-order`**: insert `<name>.html` at the determined position.

6. **Run `bash build.sh`** to verify the deck assembles without errors.

7. Report the new slide's position and ask what content to put on it.

---

## Boilerplate templates

### center layout
```html
<!-- ════════════════════════════════════════
     SLIDE_NAME
════════════════════════════════════════ -->
<div class="slide">
  <div class="center">
    <div class="dot-grid"></div>
    <div class="bg-glow-green"></div>
    <div style="position:relative;z-index:1;display:flex;flex-direction:column;align-items:center;gap:0">
      <div class="eyebrow">SECTION · TOPIC</div>
      <h2>Slide Title</h2>
      <p class="body-lg" style="max-width:700px;margin-top:20px">Supporting text goes here.</p>
    </div>
  </div>
</div>
```

### left layout
```html
<!-- ════════════════════════════════════════
     SLIDE_NAME
════════════════════════════════════════ -->
<div class="slide">
  <div class="left">
    <div class="eyebrow eyebrow-green">SECTION · TOPIC</div>
    <h2>Slide Title</h2>
    <div class="card-grid cols2" style="margin-top:32px;max-width:1000px">
      <div class="card">
        <h3>Point One</h3>
        <p class="body-sm" style="margin-top:12px">Description.</p>
      </div>
      <div class="card">
        <h3>Point Two</h3>
        <p class="body-sm" style="margin-top:12px">Description.</p>
      </div>
    </div>
  </div>
</div>
```

### split layout
```html
<!-- ════════════════════════════════════════
     SLIDE_NAME
════════════════════════════════════════ -->
<div class="slide">
  <div class="split">
    <div class="split-l">
      <div class="dot-grid"></div>
      <div style="position:relative;z-index:1">
        <div class="eyebrow eyebrow-green">SECTION · TOPIC</div>
        <h2>Slide Title</h2>
        <p class="body-md" style="margin-top:20px">Explanation on the left.</p>
      </div>
    </div>
    <div class="split-r">
      <div class="code-block">
        <div class="code-label">example</div>
        <pre>code goes here</pre>
      </div>
    </div>
  </div>
</div>
```
