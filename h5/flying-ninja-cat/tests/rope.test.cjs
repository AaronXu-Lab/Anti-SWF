const assert = require("node:assert/strict");
const fs = require("node:fs");
const path = require("node:path");
const vm = require("node:vm");

const gamePath = path.join(__dirname, "..", "game.js");
const source =
  fs.readFileSync(gamePath, "utf8").split("\nfunction drawLoading")[0] +
  "\nglobalThis.TestGame = FlyingNinjaCat;";
const drawCalls = [];
const rotations = [];
const context = new Proxy(
  {
    imageSmoothingEnabled: true,
    drawImage(...args) {
      drawCalls.push(args);
    },
    rotate(angle) {
      rotations.push(angle);
    },
  },
  {
    get(target, key) {
      return key in target ? target[key] : () => {};
    },
    set(target, key, value) {
      target[key] = value;
      return true;
    },
  },
);
const canvas = { dataset: {}, getContext: () => context };
const status = { textContent: "" };
const sandbox = {
  console,
  Math,
  Date,
  Promise,
  setTimeout,
  clearTimeout,
  document: {
    querySelector: (selector) => (selector === "#game" ? canvas : status),
  },
  window: {},
  Image: function Image() {},
  Audio: function Audio() {},
};

vm.createContext(sandbox);
vm.runInContext(source, sandbox);

const game = Object.create(sandbox.TestGame.prototype);
game.sound = { play() {}, stop() {} };
game.setStatus = () => {};

game.player = { x: 200, y: 365, status: "jump", rope: null };
game.startShoot();
assert.equal(game.player.rope.x, 212.5, "rope should start at the SWF ropepos x");
assert.equal(game.player.rope.y, 310.6, "rope should start at the SWF ropepos y");

game.blocks = [];
game.player.status = "shoot";
game.player.rope = { mode: "shoot", x: 300, y: 130 };
game.updateRopeShot();
assert.equal(game.player.status, "shoot", "rope must not attach in empty air");
assert.equal(game.player.rope.mode, "shoot", "empty-air rope should keep flying");

game.blocks = Array.from({ length: 6 }, (_, index) => ({
  type: 2,
  x: index * 150,
}));
for (let x = 0; x <= 640; x += 20) {
  for (let y = 0; y <= 480; y += 20) {
    assert.equal(
      game.ropeHitsTarget(x, y),
      false,
      `ordinary level-zero roofs must not catch at ${x},${y}`,
    );
  }
}

game.blocks = [{ type: 3, x: 345 }];
game.player.status = "shoot";
game.player.rope = { mode: "shoot", x: 300, y: 130 };
game.updateRopeShot();
assert.equal(game.player.status, "rope", "rope should attach inside a tower target");
assert.equal(game.player.rope.mode, "caught", "tower hit should catch the rope");

game.assets = { hooks: [{}, {}] };
game.player = {
  x: 200,
  y: 365,
  rope: { mode: "caught", x: 300, y: 125 },
};
drawCalls.length = 0;
rotations.length = 0;
game.drawRope();
const hookDraw = drawCalls.at(-1);
assert.equal(hookDraw[1], -32.75, "hook should use the SWF registration point x");
assert.equal(hookDraw[2], -15.5, "hook should use the SWF registration point y");
assert.ok(
  Math.abs(rotations.at(-1) - (-80 * Math.PI) / 180) < 1e-12,
  "caught hook should stay at the original -80 degree angle",
);

console.log("rope regression tests: PASS");
