# flutter_json_schemas

A comprehensive JSON Schema repository for Flutter's dynamic widget and theming ecosystem.

## Overview

This repository provides **JSON Schema (draft-07)** definitions for:
- **[json_dynamic_widget](https://pub.dev/packages/json_dynamic_widget)** — Flutter package for rendering dynamic widgets from JSON
- **[json_theme](https://pub.dev/packages/json_theme)** — Flutter package for JSON-based theme definitions
- **Plugin Schemas** — Extended schemas for Charts, Markdown, Lottie, Rive, SVG, and icon packages

These schemas enable:
✅ **Validation** — Validate JSON configurations before runtime  
✅ **IDE Support** — Schema-aware code completion in JSON editors  
✅ **Documentation** — Self-documenting JSON structure with examples  
✅ **Type Safety** — Catch configuration errors early in development  

## Framework Support

- **Latest Stable**: Flutter 3.38.5+ / Dart 3.10.4+
- **json_dynamic_widget**: v12.0.0+
- **json_theme**: v11.0.0+

📋 See [COMPATIBILITY.md](./COMPATIBILITY.md) for detailed version requirements

## Schemas Available

### Core Packages
- **json_dynamic_widget** (118 schemas) — All supported Flutter widgets
- **json_theme** (204 schemas) — Complete Flutter theming system

### Plugin Extensions
- **Charts Flutter** (88 schemas) — Bar, line, pie, and scatter charts
- **Markdown** (3 schemas) — Markdown rendering widgets
- **Icons & Graphics** — Font Awesome, Material Icons, Lottie, Rive, SVG, IcoIcons

**Total:** 633+ schema and documentation files

## Quick Start

### Using Schemas in Your IDE

1. In VS Code or other JSON editors, reference schemas:
```json
{
  "$schema": "https://kechankrisna.github.io/flutter_json_schemas/schemas/json_dynamic_widget/container.json",
  "type": "container",
  "properties": { }
}
```

2. Get autocomplete and validation in real-time

### Local Validation

Clone the repo and validate your JSON:
```bash
./scripts/validate-schemas.sh
```

### Find a Schema

Browse all available schemas:
- **Core Widgets**: `/schemas/json_dynamic_widget/*.json`
- **Theme Components**: `/schemas/json_theme/*.json`
- **Documentation**: `/docs/` — Each schema has corresponding markdown docs

## Repository Structure

```
flutter_json_schemas/
├── schemas/               # JSON Schema files (host on GitHub Pages)
│   ├── json_dynamic_widget/
│   ├── json_theme/
│   └── [plugin schemas]/
├── docs/                  # Documentation for each schema
│   ├── json_dynamic_widget/
│   ├── json_theme/
│   └── [plugin docs]/
└── scripts/               # Validation and utility scripts
    └── validate-schemas.sh
```

## Contributing

We welcome contributions! Whether you're fixing documentation, improving schemas, or adding new capabilities:

1. **Read [CONTRIBUTING.md](./CONTRIBUTING.md)** for guidelines
2. **Check [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md)** for community standards
3. **Fork & Create a branch** for your changes
4. **Run validations** locally before opening a PR:
   ```bash
   ./scripts/validate-schemas.sh
   ```

### Areas for Contribution
- **Schema Improvements** — Better descriptions, examples, or validation rules
- **Documentation** — Clearer explanations, use cases, or tutorials
- **Bug Reports** — Found an issue? Open a GitHub issue
- **Feature Requests** — Have an idea? Let's discuss it

## Schema Updates

Schemas are automatically updated when new versions of json_dynamic_widget or json_theme are released. To report an outdated schema:
- Open an issue with the package version and expected changes

## License

MIT License — Copyright © Peiffer Innovations, LLC

See [LICENSE](./LICENSE) for details.

## Community

- **Issues & Discussions** — GitHub Issues for bugs and feature requests
- **Pull Requests** — Contributions welcome following CONTRIBUTING.md guidelines

---

[Learn more about json_dynamic_widget](https://pub.dev/packages/json_dynamic_widget) | [Learn more about json_theme](https://pub.dev/packages/json_theme)
