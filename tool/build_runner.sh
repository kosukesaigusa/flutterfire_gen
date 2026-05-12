#!/usr/bin/env bash
# Run `dart run build_runner build` in every workspace package that depends on
# `build_runner`. This replaces the `melos run generate` script that the
# repository previously relied on, now that the monorepo uses Dart workspaces
# instead of melos.
set -euo pipefail

# Packages whose `pubspec.yaml` declares `build_runner` as a dev_dependency.
PACKAGES=(
  "packages/flutterfire_gen"
  "examples/counter"
  "examples/todo"
)

repo_root="$(cd "$(dirname "$0")/.." && pwd)"

for pkg in "${PACKAGES[@]}"; do
  echo "==> dart run build_runner build in $pkg"
  (cd "$repo_root/$pkg" && dart run build_runner build --delete-conflicting-outputs)
done
