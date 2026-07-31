# Repository Instructions

## Purpose

This repository reverse-engineers legacy SWF games and produces standalone HTML5
reimplementations. Preserve original inputs, keep disposable reverse-engineering
artifacts isolated, and ensure every final H5 game runs without SWF, Ruffle, or
files under `temp/`.

## Directory Contract

- `.agents/skills/`: project-level reusable AI workflows.
- `docs/`: durable workflows and research records.
- `tools/scripts/`: repository-owned analysis, decompilation, and patch scripts.
- `tools/vendor/`: third-party tools. Do not modify vendored files unless the task
  is explicitly upgrading or patching that tool.
- `swfs/<game>/`: immutable original SWF inputs plus `manifest.json`.
- `h5/<game>/`: the standalone converted game, its runtime assets, README, and
  permanent regression tests.
- `temp/<game>/work/`: generated decompiler output, patched SWFs, and experiments.
- `temp/<game>/validation/`: disposable screenshots and one-off validation reports.

The entire `temp/` tree is disposable and ignored by Git. Never make code,
documentation links required for operation, tests, or runtime assets depend on it.

## Naming and Locality

- Use stable lowercase kebab-case game IDs, such as `flying-ninja-cat`.
- Keep all original inputs for a game in `swfs/<game>/`.
- Keep all final runtime files and permanent tests for that game in `h5/<game>/`.
- Put reusable logic in `tools/scripts/`; keep game-specific investigation inside
  that game's directories.

## Required Validation

For Flying Ninja Cat, run from the repository root:

```bash
node h5/flying-ninja-cat/tests/rope.test.cjs
node --check h5/flying-ninja-cat/game.js
git diff --check
```

For browser verification:

```bash
python3 -m http.server 4173
```

Then open `http://127.0.0.1:4173/h5/flying-ninja-cat/`. Verify with an empty
browser cache when changing exported images or cache-version query strings.

## SWF Workflow

Use the project skill at `.agents/skills/convert-swf-to-h5/` whenever onboarding,
analyzing, converting, or validating a SWF game.

1. Record original files and SHA-256 hashes in `swfs/<game>/manifest.json`.
2. Write all FFDec and experimental output under `temp/<game>/work/`.
3. Document durable findings in `docs/` or the game's H5 README.
4. Copy only required, cleaned runtime assets into `h5/<game>/assets/`.
5. Add permanent regression tests under `h5/<game>/tests/`.
6. Confirm the H5 game still works after deleting `temp/<game>/`.

Do not overwrite or mutate an original SWF in place. Patched SWFs belong under
`temp/<game>/work/`.

## Change Discipline

- Preserve unrelated user changes in the working tree.
- Treat generated images as binary source artifacts; do not recompress or resize
  them unless the task requires it.
- When changing sprite placement, derive anchors from SWF registration points or
  validated pixel bounds and add a regression check.
- When changing collision logic, test both positive hits and nearby misses.
- Keep H5 runtime paths relative to the game's own directory.
- Do not introduce network dependencies into a converted game unless explicitly
  requested.
