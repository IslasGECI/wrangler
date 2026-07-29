# Metadata Wrangler <a><img src='https://i.imgur.com/BRHIIhr.png' align="right" height="135.5" /></a>

**metadata-wrangler** — a Python package for loading and manipulating tabular data (CSV + `datapackage.json`) with rich metadata. Wraps a `pandas` DataFrame in a `DataTable` class carrying `ResourceMetadata` (name, description, source, etc.) and per-column `VariableMetadata` (units, axis, standard name). Supports filtering via `where()`, column transforms via `apply()`, and column lookups by `Axis` or `StandardName`.

[![codecov](https://codecov.io/gh/IslasGECI/wrangler/branch/develop/graph/badge.svg)](https://codecov.io/gh/IslasGECI/wrangler)
![GitHub Actions](https://github.com/IslasGECI/wrangler/actions/workflows/actions.yml/badge.svg)
![GitHub issues](https://img.shields.io/github/issues-pr/IslasGECI/wrangler)
![licencia](https://img.shields.io/github/license/IslasGECI/wrangler)
![languages](https://img.shields.io/github/languages/top/IslasGECI/wrangler)
![commits](https://img.shields.io/github/commit-activity/y/IslasGECI/wrangler)

