# Framework Compatibility

## Latest Stable Versions

This schema repository targets the **latest stable Flutter framework** versions.

### Current Requirements

| Package | Version | Dart SDK | Flutter | Status |
|---------|---------|----------|---------|--------|
| **json_dynamic_widget** | 12.0.0+ | ^3.10.4 | 3.38.5+ | ✅ Latest |
| **json_theme** | 11.0.0+ | ^3.10.4 | 3.38.5+ | ✅ Latest |
| **Dart** | N/A | 3.10.4+ | — | ✅ Current |
| **Flutter** | N/A | — | 3.38.5+ | ✅ Current |

### Minimum Requirements

- **Flutter**: 3.24.0 or later
- **Dart**: 3.9.0 or later
- **Schema Version**: 1.0.0+

### Legacy Versions

For older Flutter/Dart versions:
- Flutter 3.22.x → Use json_dynamic_widget v11.x
- Flutter 3.19.x → Use json_dynamic_widget v10.x
- Flutter 3.16.x → Use json_dynamic_widget v9.x

## Schema Compatibility

All JSON schemas in this repository are compatible with:
- ✅ Flutter 3.24+ (latest stable)
- ✅ Dart 3.9.0+
- ✅ json_dynamic_widget 12.0.0+
- ✅ json_theme 11.0.0+

### Plugin Schemas

Extended plugin support:
- 📊 **Charts Flutter**: Compatible with latest versions
- 📝 **Markdown Plugin**: Latest version compatible
- 🎨 **Icon Packages**: All major icon libraries supported
- 🎬 **Rive & Lottie**: Latest animation packages

## Checking Your Flutter Version

```bash
# Check your Flutter and Dart versions
flutter --version

# Upgrade to latest stable
flutter upgrade

# Check package compatibility
flutter pub outdated
```

## Updating Schemas

When Flutter or the upstream packages release new versions:

1. **Check Release Notes** — Review what's new in the Flutter/package release
2. **Update Schemas** — New widgets/properties may need schema additions
3. **Update Documentation** — Add new widget/theme docs if applicable
4. **Run Validation** — Ensure all schemas are valid
5. **Create PR** — Reference the Flutter/package version in your PR

## Support Policy

- ✅ **Current Stable**: Fully supported and actively maintained
- ⚠️ **Previous Major**: Best-effort support for critical issues
- ❌ **Older Versions**: Not officially supported (but may work)

## Reporting Version Issues

If you find compatibility issues:
1. Check your Flutter version: `flutter --version`
2. Open an issue with:
   - Your Flutter/Dart version
   - Schema file name
   - Error message or unexpected behavior
   - Expected behavior

---

Last Updated: 2025-05-02
Schema Version: 1.0.0
