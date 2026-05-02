# Contributing to flutter_json_schemas

Thank you for interest in contributing to the flutter_json_schemas repository! This guide will help you get started.

## Code of Conduct

This project adheres to a [Code of Conduct](./CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to the project maintainers.

## Getting Started

### Prerequisites

- Git
- `jq` (for JSON validation) — Install with `brew install jq` (macOS) or `apt-get install jq` (Linux)

### Local Setup

```bash
# Clone the repository
git clone https://github.com/kechankrisna/flutter_json_schemas.git
cd flutter_json_schemas

# Run validation on existing schemas
./scripts/validate-schemas.sh
```

## Types of Contributions

### 1. Schema Updates

When upstream packages (json_dynamic_widget, json_theme) release new versions:

- **Report Missing Schemas**: Open an issue noting the package version and missing widget/component names
- **Propose Schema Changes**: Describe what changed in the upstream package
- **Create Schema Files**: Follow the JSON Schema draft-7 format

**Schema Format Example**:
```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "$id": "https://kechankrisna.github.io/flutter_json_schemas/schemas/json_dynamic_widget/example.json",
  "type": "object",
  "title": "Example Widget",
  "description": "Description of the example widget",
  "properties": {
    "type": {
      "type": "string",
      "enum": ["example"],
      "description": "The widget type identifier"
    }
  },
  "required": ["type"]
}
```

### 2. Documentation Improvements

Each schema should have corresponding markdown documentation in `/docs/`. Documentation should include:

- **Description**: What the widget/component does
- **Properties**: Explanation of each JSON schema property
- **Examples**: Working JSON examples showing how to use it
- **Links**: References to Flutter documentation or upstream package docs

**Documentation Format**:
```markdown
# Widget Name

## Description
Clear explanation of what this widget does and when to use it.

## Properties

### `type`
- **Type**: `string`
- **Required**: `true`
- **Description**: Widget type identifier

### `properties`
- **Type**: `object`
- **Required**: `false`
- **Description**: Widget-specific properties

## Examples

### Basic Example
```json
{
  "type": "widget_name",
  "properties": {}
}
```

## Flutter Reference
[Link to official Flutter documentation](https://api.flutter.dev/)
```

### 3. Bug Reports

If you find an issue with a schema:

1. **Check existing issues** to avoid duplicates
2. **Open an issue** with:
   - Schema file path
   - What's wrong (validation error, incorrect property, etc.)
   - Expected behavior
   - JSON example demonstrating the issue

### 4. Feature Requests

Have an idea for improving schemas or documentation?

1. **Search existing issues** to check if it's already proposed
2. **Open an issue** describing:
   - What feature you'd like
   - Why it would be useful
   - Relevant links to Flutter docs or packages

## Making Changes

### 1. Create a Branch

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/issue-description
```

Use descriptive branch names:
- `feature/add-new-widget-schemas` ✅
- `fix/broken-ref-in-theme` ✅
- `docs/improve-container-docs` ✅
- `update` ❌ (too vague)

### 2. Make Your Changes

- **Schema Changes**: Ensure JSON is valid and references are correct
- **Documentation Changes**: Keep formatting consistent
- **Multiple Changes**: Keep related changes in one PR, separate unrelated changes

### 3. Validate Locally

Before committing, run the validation script:

```bash
./scripts/validate-schemas.sh
```

This checks:
- ✅ JSON syntax validity
- ✅ Schema structure correctness
- ✅ Broken `$ref` links
- ✅ Documentation-schema parity
- ✅ JSON formatting consistency

### 4. Commit with Clear Messages

```bash
git add schemas/json_dynamic_widget/container.json docs/json_dynamic_widget/container.md

git commit -m "docs: improve container schema documentation

- Add property descriptions
- Include usage examples
- Link to Flutter documentation"
```

**Commit message format**:
```
<type>: <subject>

<body>

<footer>
```

**Types**:
- `feat`: New schema or feature
- `fix`: Bug fix in schema or reference
- `docs`: Documentation changes
- `style`: JSON formatting or schema structure
- `refactor`: Reorganizing schemas or references
- `test`: Adding or updating validation tests
- `chore`: Maintenance tasks

### 5. Push and Create a Pull Request

```bash
git push origin feature/your-feature-name
```

Then create a PR with:
- **Title**: Clear, short description
- **Description**: Explain what changed and why
- **Checklist**: Mark completed items:
  - [ ] Validation script passes (`./scripts/validate-schemas.sh`)
  - [ ] JSON is properly formatted
  - [ ] Documentation is updated (if applicable)
  - [ ] Related issues are referenced
  - [ ] No unrelated changes included

## PR Review Process

1. **Automated Checks**: CI/CD validates schemas
2. **Manual Review**: Maintainers review for:
   - Schema correctness
   - Documentation clarity
   - Alignment with Flutter package versions
   - Community standards
3. **Feedback**: Address review comments or ask questions
4. **Merge**: Once approved, your PR will be merged!

## Updating Schemas for New Package Versions

When `json_dynamic_widget` or `json_theme` releases a new version:

1. **Check the changelog** for new widgets/components
2. **Identify schema changes** (new, modified, or removed)
3. **Update affected schemas** in `schemas/`
4. **Update or create documentation** in `docs/`
5. **Run validation**: `./scripts/validate-schemas.sh`
6. **Create a PR** with title like: `feat: update schemas for json_dynamic_widget v2.0.0`

## Questions?

- **How do I...?** Check existing issues or ask in a new issue
- **I found a bug**: Open a bug report issue
- **I want to contribute but unsure how**: Start with good-first-issue tagged issues
- **Need help?** Ask in your PR or issue — we're here to help!

## Release Process

Releases follow semantic versioning (MAJOR.MINOR.PATCH):
- **MAJOR**: Breaking schema changes
- **MINOR**: New schemas or non-breaking changes
- **PATCH**: Documentation fixes or minor schema improvements

Maintainers handle releases. After your PR is merged, you'll be credited in the changelog.

---

Thank you for contributing to flutter_json_schemas! 🎉
