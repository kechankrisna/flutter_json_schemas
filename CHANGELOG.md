# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Schema Versioning

Schemas are versioned independently for each package they target:
- **MAJOR** — Breaking changes to schema structure (existing properties removed/renamed)
- **MINOR** — New properties or non-breaking schema additions
- **PATCH** — Documentation updates, minor fixes, or schema clarifications

## Unreleased

### Added
- Initial automated validation workflow with GitHub Actions
- Contribution guidelines and code of conduct
- Issue and PR templates for community engagement
- Upstream package monitoring workflow
- Validation script for local testing
- Framework compatibility documentation

### Changed
- Enhanced README with comprehensive project overview
- Improved documentation structure and format
- Updated VERSION tracking for latest framework support

---

## [1.0.0] — Initial Release

### Added
- JSON Schema definitions for json_dynamic_widget (118 schemas)
- JSON Schema definitions for json_theme (204 schemas)
- Plugin schemas for Charts Flutter, Markdown, and icon packages
- Comprehensive markdown documentation for all schemas
- GitHub Pages hosting for schemas
- **Framework Support**: Flutter 3.38.5+ / Dart 3.10.4+

### Features
- ✅ **Validation** — Schemas validate JSON configurations
- ✅ **IDE Support** — Schema-aware code completion
- ✅ **Documentation** — Self-documenting JSON structures
- ✅ **Type Safety** — Catch configuration errors early
- ✅ **Latest Framework** — Supports Flutter 3.38.5+ with json_dynamic_widget 12.0+

---

## Tracked Package Versions

Current schemas target:
- **json_dynamic_widget**: v12.0.0+
- **json_theme**: v11.0.0+
- **Flutter**: 3.38.5+ (latest stable)
- **Dart**: 3.10.4+
- **Charts Flutter**: Latest compatible version
- **Markdown Plugin**: Latest compatible version
- **Icon Packages**: Latest compatible versions

---

## How to Report Changes

When an upstream package (json_dynamic_widget or json_theme) releases a new version:

1. Open an issue with: `[UPSTREAM UPDATE] Package v1.2.3`
2. Include:
   - Package name and version
   - Links to package changelog
   - Summary of schema-relevant changes
3. Reference this in your update PR

## Framework Compatibility

See [COMPATIBILITY.md](./COMPATIBILITY.md) for:
- Latest supported Flutter versions
- Dart SDK requirements
- Legacy version support
- How to check and upgrade your Flutter version

## Future Releases

Releases will be published when:
- Upstream packages release new versions requiring schema updates
- Flutter releases new features affecting schemas
- Significant documentation improvements are made
- Community contributions are integrated
- Schema validation rules are enhanced

---

## How to Contribute

Want to help maintain these schemas? See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.
