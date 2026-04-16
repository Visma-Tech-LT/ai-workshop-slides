Remove a slide from the deck.

Arguments: $ARGUMENTS

Expected input: slide name (with or without `.html`), e.g. `lunch` or `lunch.html`.

## Steps

1. **Validate** that the slide exists in `slide-order`. If not, report error and list available slides.

2. **Show what will be deleted** — the slide's current position and filename — and ask for confirmation before proceeding.

3. **Remove the slide's line** from `slide-order`.

4. **Ask the user** whether to also delete the `slides/<name>.html` file or just remove it from the manifest (keeping the file as an orphan for later use).

5. If deleting the file: delete `slides/<name>.html`.

6. **Run `bash build.sh`** to verify the deck still assembles.

7. Report the updated slide count.
