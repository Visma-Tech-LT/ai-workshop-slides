Move a slide to a different position in the deck.

Arguments: $ARGUMENTS

Expected input (flexible — parse what makes sense):
- `hooks after:mcp` — move hooks.html to appear after mcp.html
- `hooks before:security` — move hooks.html to appear before security.html
- `hooks at:3` — move hooks.html to position 3 (1-based)
- `hooks to:end` — move hooks.html to the last position
- `hooks to:start` — move hooks.html to the first position

## Steps

1. **Parse** the slide to move and the target position from $ARGUMENTS.
   - Accept filenames with or without `.html`.

2. **Read `slide-order`** and validate that the named slide exists in it.
   - If not found, report the error and list available slide names.

3. **Compute the new order**: remove the slide from its current line, then insert it at the target position.

4. **Preview the change**: show the before/after positions (just the surrounding 3 lines) and ask the user to confirm before writing.

5. **Write the updated `slide-order`** file.

6. **Run `bash build.sh`** to verify the deck assembles correctly.

7. Report the slide's new position number.
