# Pitfalls and Recovery Tactics

## Contents

1. Decompilation and obfuscation
2. Runtime and black screens
3. Asset export contamination
4. Coordinates, registration, and collision
5. Browser and cache behavior
6. Testing and repository hygiene

## 1. Decompilation and obfuscation

### Default FFDec output can create a false “impossible” verdict

Control-flow flattening appears as `while(true)`, numeric state transitions, `§§push`,
`§§pop`, and `eval("\\x01")`. Raise the AS1/2 execution limit and use conservative
deobfuscation before abandoning a native rewrite.

### Aggressive cleanup can silently delete real behavior

Automatic identifier renaming and removal of “invalid name assignments” reduced the recovered
main class in Flying Ninja Cat from 48 methods to 28. Compare method counts, classes, data
tables, and key transitions across exports. “Fewer weird names” is not a quality metric.

### Constant-pool poisoning produces valid-looking nonsense

Multiple `ConstantPool` instructions in one action block can cause a decompiler to select the
wrong strings. Inspect P-code, substitute each pool, and choose the one that yields coherent
Flash operations such as `_url`, `indexOf`, and `unloadMovie`.

### Unknown tag codes are evidence, not proof

Private or deliberately invalid tags may confuse simple parsers while Flash/Ruffle skips them.
Treat them as a supporting obfuscation signal. Do not strip tags from the original; experiment
only on copies under `temp/`.

## 2. Runtime and black screens

### Missing runtime-loaded SWFs look like renderer failure

Search strings for `.swf` and inspect network 404s. A resource package may provide the title,
preloader, fonts, or assets while the main timeline remains blank.

### A hidden browser tab can stop Ruffle from producing frames

`document.hidden` may throttle `requestAnimationFrame`, leaving a black canvas. Temporarily
replace rAF with a timer to distinguish visibility throttling from broken content:

```javascript
window.requestAnimationFrame = (callback) =>
  setTimeout(() => callback(performance.now()), 16);
```

Remove this diagnostic override afterward.

### Test the renderer before reverse-engineering a domain lock

Set a conspicuous player background color. If the stage changes color, rendering is alive and
the problem is content, script, visibility, or missing resources. Check network and rendered
frames before patching suspected anti-debug logic.

### Empty frame 1 may be normal

Script-driven AS2 games often assemble the screen with `attachMovie` on later frames. Inspect
multiple exported frames and timeline actions before concluding that extraction failed.

### Disable legacy networking deliberately

For a Ruffle shell, deny networking at the player layer. If a binary patch is required, preserve
byte length. Shortening or lengthening a null-terminated ActionScript string can invalidate
constant indexes, action lengths, and jump offsets. Always patch a copy and assert equal length.

## 3. Asset export contamination

### A parent sprite export may bake in an unrelated effect

Flying Ninja Cat's parent character timeline included an `effect_mc` sibling, so every exported
cat frame carried fireworks. Inspect the timeline/XML and contact sheet. Export the clean child
sprite or remove only the unwanted `PlaceObject` from a temporary SWF copy before re-exporting.

### Frame count alone does not prove animation correctness

Nested timelines can duplicate frames or hold a child frame while the parent advances. Compare
alpha bounds and pixels across the sequence, not just filenames and counts.

### Transparent canvas size is not visible content size

Record both PNG dimensions and alpha bounding boxes. Large transparent margins alter naive
centering and can make an otherwise correct sprite appear consistently displaced.

## 4. Coordinates, registration, and collision

### Exported canvas origin is not the MovieClip registration point

A sprite with an 80×56 export is not necessarily centered at `(40, 28)`. Derive the origin from
SWF shape bounds and matrices. In the case study, the hook origin was `(32.75, 15.5)`.

### Logical spacing is not texture width

Flying Ninja Cat used 150px map spacing but a 255px block export centered on the block origin.
Using half the logical width as the image offset moved the building by about 75px. Keep spacing,
draw offset, and collision width as separate constants.

### Visible artwork is not the collision shape

The original used invisible clips such as `ground_pos` and `rope_pos`. Recover their matrices and
shape bounds. Test positive hits and nearby misses. Never replace them with a convenient height
threshold; doing so allowed ropes to attach in empty air.

### The same anchor must feed initialization, drawing, and angle math

Duplicating slightly different hand/rope offsets caused the line and hook to drift. Centralize
registration constants and use them in simulation and rendering. Preserve fixed original angles
for caught or locked states when the SWF explicitly sets one.

### Twips errors are exactly 20×

All tag geometry is in twips. Divide by 20 once at the extraction seam and label converted values
as pixels. Avoid mixing converted and raw coordinates in the same table.

## 5. Browser and cache behavior

### A fixed file does not update an already-running game instance

An old tab can continue executing the pre-fix script indefinitely. A screenshot from that tab may
appear to disprove the patch. Change the script or asset query version, expose a build identifier,
navigate to a unique URL, and verify the loaded build before evaluating behavior.

### Reloading HTML may still retain changed subresources

Version every changed script or binary asset during validation. Confirm the actual request URL and
HTTP status; do not infer success from the address bar.

### Autoplay failure is not an audio asset failure

Browsers reject audio playback before user interaction. Start music on the first valid input and
handle rejected play promises without breaking game initialization.

### Manual random play is a weak reproduction loop

Difficulty gates and random maps can make a bug appear fixed simply because the relevant block
did not spawn. Seed randomness or create a direct simulation fixture that places the required
blocks, items, and player state.

## 6. Testing and repository hygiene

### State-only tests miss visual registration bugs

Capture canvas draw arguments, transforms, alpha bounds, or screenshots. Assert that collision
regions overlap the displayed artwork when the bug is visual.

### Keep a real seam for the simulation

Avoid constructing browser globals inside game logic. Accept dependencies and let tests instantiate
the simulation without DOM, audio, or animation loops.

### Do not run prose punctuation formatters over code

Tools that convert half-width punctuation near Chinese text can turn valid calls such as
`foo('中文')` into invalid syntax. Restrict prose formatters to documentation files.

### Preserve originals and unrelated worktree changes

Store experiments under `temp/`, never overwrite source SWFs, and inspect Git status before broad
moves or rewrites. Treat generated images as binary source artifacts unless recompression is an
explicit task.
