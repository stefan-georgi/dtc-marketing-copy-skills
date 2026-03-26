#!/usr/bin/env node

// RMBC Skills — Installer
// Copies skills to ~/.claude/skills/dtc-copywriting-skills/
// Used by: npx dtcmarketingskills

import { cpSync, existsSync, lstatSync, mkdirSync, readFileSync, readdirSync, renameSync, rmSync, writeFileSync } from 'node:fs';
import { dirname, join, resolve } from 'node:path';
import { homedir } from 'node:os';
import { fileURLToPath } from 'node:url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const PKG_ROOT = resolve(__dirname, '..');

const TARGET_DIR = join(homedir(), '.claude', 'skills');
const TARGET_NAME = 'dtc-copywriting-skills';
const TARGET_PATH = join(TARGET_DIR, TARGET_NAME);
const TARGET_BAK = TARGET_PATH + '.bak';
const TARGET_NEW = TARGET_PATH + '.new';

// Verify package root
if (!existsSync(join(PKG_ROOT, 'skills'))) {
  console.error('Error: skills/ directory not found. Package may be corrupted.');
  process.exit(1);
}

// Clean up stale .bak from interrupted prior run
if (existsSync(TARGET_BAK)) {
  console.log('Cleaning up incomplete previous install...');
  rmSync(TARGET_BAK, { recursive: true, force: true });
}

// Clean up stale .new from interrupted prior run
if (existsSync(TARGET_NEW)) {
  rmSync(TARGET_NEW, { recursive: true, force: true });
}

// Create target parent
mkdirSync(TARGET_DIR, { recursive: true });

// Warn if replacing a symlink (from ./setup)
if (existsSync(TARGET_PATH) && lstatSync(TARGET_PATH).isSymbolicLink()) {
  console.log('Note: Replacing symlink install with copy install.');
  console.log('For auto-updates via git pull, use ./setup instead of npx.');
  rmSync(TARGET_PATH, { force: true });
}

// Files and directories to copy
const COPY_ITEMS = [
  { src: 'skills', type: 'dir' },
  { src: 'bin/rmbc-update-check', type: 'file' },
  { src: 'bin/rmbc-analytics', type: 'file' },
  { src: 'bin/rmbc-workspace', type: 'file' },
  { src: 'lib', type: 'dir' },
  { src: 'VERSION', type: 'file' },
  { src: 'CHANGELOG.md', type: 'file' },
  { src: 'bin/rmbc-upgrade', type: 'file' },
  { src: 'README.md', type: 'file' },
  { src: 'LICENSE', type: 'file' },
];

// Build into .new directory first
mkdirSync(TARGET_NEW, { recursive: true });
mkdirSync(join(TARGET_NEW, 'bin'), { recursive: true });

for (const item of COPY_ITEMS) {
  const src = join(PKG_ROOT, item.src);
  const dest = join(TARGET_NEW, item.src);
  if (!existsSync(src)) continue;
  if (item.type === 'dir') {
    cpSync(src, dest, { recursive: true });
  } else {
    mkdirSync(dirname(dest), { recursive: true });
    cpSync(src, dest);
  }
}

// Atomic swap: existing -> .bak, .new -> target
if (existsSync(TARGET_PATH)) {
  renameSync(TARGET_PATH, TARGET_BAK);
}
renameSync(TARGET_NEW, TARGET_PATH);
if (existsSync(TARGET_BAK)) {
  rmSync(TARGET_BAK, { recursive: true, force: true });
}

// Create state directory with config defaults
const STATE_DIR = join(homedir(), '.rmbc-skills');
mkdirSync(STATE_DIR, { recursive: true });
const CONFIG_PATH = join(STATE_DIR, 'config.yaml');
if (!existsSync(CONFIG_PATH)) {
  writeFileSync(CONFIG_PATH, 'analytics_enabled: true\nauto_upgrade: false\nlast_update_check: ""\nactive_product: ""\n');
}

// Copy individual skills into ~/.claude/skills/<name>/ for auto-discovery
// Claude Code discovers skills at ~/.claude/skills/<name>/SKILL.md
const skillsDir = join(TARGET_PATH, 'skills');
let skillCount = 0;
if (existsSync(skillsDir)) {
  for (const d of readdirSync(skillsDir)) {
    if (!existsSync(join(skillsDir, d, 'SKILL.md'))) continue;
    const skillTarget = join(TARGET_DIR, d);
    // Skip if a non-package directory already exists (avoid conflicts)
    if (existsSync(skillTarget) && !existsSync(join(skillTarget, '.rmbc-managed'))) continue;
    rmSync(skillTarget, { recursive: true, force: true });
    cpSync(join(skillsDir, d), skillTarget, { recursive: true });
    writeFileSync(join(skillTarget, '.rmbc-managed'), '');
    if (!d.includes('-variant') && !d.includes('-r2-') && !d.includes('-ad1-')) {
      skillCount++;
    }
  }
}

const version = existsSync(join(TARGET_PATH, 'VERSION'))
  ? readFileSync(join(TARGET_PATH, 'VERSION'), 'utf-8').trim()
  : 'unknown';

console.log('');
console.log(`RMBC Skills v${version} installed (${skillCount} skills)`);
console.log(`Package: ${TARGET_PATH}`);
console.log(`Skills: ${skillCount} copied to ${TARGET_DIR}/`);
console.log('');
console.log('Next step: Add this to your CLAUDE.md:');
console.log('  ## RMBC Skills');
console.log('  Use /write-copy to access all RMBC copywriting skills.');
