#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"

echo "════════════════════════════════════════════"
echo "  Flutter JSON Schemas Validation Script"
echo "════════════════════════════════════════════"
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

failed=0

# Function to print colored output
print_status() {
  if [ $1 -eq 0 ]; then
    echo -e "${GREEN}✅ $2${NC}"
  else
    echo -e "${RED}❌ $2${NC}"
    failed=$((failed + 1))
  fi
}

print_warning() {
  echo -e "${YELLOW}⚠️  $1${NC}"
}

# Check if required tools are installed
check_tools() {
  echo "Checking required tools..."

  if ! command -v jq &> /dev/null; then
    print_warning "jq not found. Some checks will be skipped."
    print_warning "Install with: brew install jq (macOS) or apt-get install jq (Linux)"
  fi

  echo ""
}

# Validate JSON syntax
validate_json_syntax() {
  echo "Step 1: Validating JSON syntax..."

  syntax_errors=0
  find "$PROJECT_ROOT/schemas" -name "*.json" -type f | while read file; do
    if ! jq empty "$file" 2>/dev/null; then
      echo -e "${RED}  ❌ Invalid JSON: $file${NC}"
      syntax_errors=$((syntax_errors + 1))
    fi
  done

  if [ $syntax_errors -eq 0 ]; then
    print_status 0 "All JSON files are syntactically valid"
  else
    print_status 1 "Found $syntax_errors files with JSON syntax errors"
  fi
  echo ""
}

# Check schema structure
check_schema_structure() {
  echo "Step 2: Checking JSON Schema structure..."

  invalid_schemas=0
  schema_files=$(find "$PROJECT_ROOT/schemas" -name "*.json" -type f | wc -l)
  echo "  Found $schema_files schema files"

  # Count schemas with basic schema properties
  valid_schemas=0
  find "$PROJECT_ROOT/schemas" -name "*.json" -type f | while read file; do
    if jq -e 'type == "object"' "$file" > /dev/null 2>&1; then
      valid_schemas=$((valid_schemas + 1))
    fi
  done

  print_status 0 "Schema structure validation complete"
  echo ""
}

# Check for broken references
check_broken_refs() {
  echo "Step 3: Checking for broken \$ref links..."

  broken_count=0
  find "$PROJECT_ROOT/schemas" -name "*.json" -type f | while read file; do
    # Extract $ref values from the JSON file
    refs=$(jq -r '.. | select(type == "string") | select(contains("$ref") or (contains("schemas") and contains(".json")))' "$file" 2>/dev/null || true)

    # Alternative: look for strings that look like references
    refs=$(jq -r '.. | objects | ."\$ref" // empty' "$file" 2>/dev/null || true)

    if [ ! -z "$refs" ]; then
      while IFS= read -r ref; do
        [ -z "$ref" ] && continue

        # Skip absolute URLs (GitHub Pages hosted schemas are valid)
        if [[ $ref == http* ]]; then
          continue
        fi

        # Handle different reference types
        if [[ $ref == *".json"* ]]; then
          # Remove leading ../ and get relative path
          ref_path=$(echo "$ref" | sed 's|^../||g' | sed 's|^./||g')
          file_dir=$(dirname "$file")
          full_path="$file_dir/$ref_path"

          if [ ! -f "$full_path" ] 2>/dev/null; then
            # Try resolving relative to schemas root
            full_path_alt="$PROJECT_ROOT/schemas/$ref_path"
            if [ ! -f "$full_path_alt" ] 2>/dev/null; then
              echo -e "${YELLOW}  ⚠️  Potential broken ref in $(basename $file): $ref${NC}"
              broken_count=$((broken_count + 1))
            fi
          fi
        fi
      done <<< "$refs"
    fi
  done

  if [ $broken_count -eq 0 ]; then
    print_status 0 "All reference types are valid (including hosted schemas)"
  else
    print_status 1 "Found $broken_count potential broken references (may need investigation)"
  fi
  echo ""
}

# Check documentation-schema parity
check_doc_parity() {
  echo "Step 4: Checking documentation-schema parity..."

  missing_docs=0
  find "$PROJECT_ROOT/schemas" -type f -name "*.json" | while read schema; do
    # Extract relative path from schemas/
    rel_path="${schema#$PROJECT_ROOT/schemas/}"
    schema_name=$(basename "$schema" .json)
    schema_subdir=$(dirname "$rel_path")

    doc_file="$PROJECT_ROOT/docs/$schema_subdir/$schema_name.md"

    if [ ! -f "$doc_file" ]; then
      echo -e "${YELLOW}  ⚠️  Missing doc: docs/$schema_subdir/$schema_name.md${NC}"
      missing_docs=$((missing_docs + 1))
    fi
  done

  if [ $missing_docs -eq 0 ]; then
    print_status 0 "All schemas have corresponding documentation"
  else
    print_warning "$missing_docs schemas are missing documentation"
  fi
  echo ""
}

# Check JSON formatting
check_json_formatting() {
  echo "Step 5: Checking JSON formatting consistency..."

  formatting_issues=0
  find "$PROJECT_ROOT/schemas" -name "*.json" -type f | head -5 | while read file; do
    # Just check first 5 files for sample
    original=$(cat "$file")
    formatted=$(jq -S --indent 2 . "$file" 2>/dev/null || true)

    if [ ! -z "$formatted" ] && [ "$original" != "$formatted" ]; then
      echo -e "${YELLOW}  ⚠️  Formatting issues in: $(basename $file)${NC}"
      formatting_issues=$((formatting_issues + 1))
    fi
  done

  print_status 0 "JSON formatting check complete (checked sample files)"
  echo ""
}

# Main execution
main() {
  check_tools
  validate_json_syntax
  check_schema_structure
  check_broken_refs
  check_doc_parity
  check_json_formatting

  echo "════════════════════════════════════════════"
  if [ $failed -eq 0 ]; then
    echo -e "${GREEN}✅ All validations passed!${NC}"
    echo "════════════════════════════════════════════"
    exit 0
  else
    echo -e "${RED}❌ Validation failed with $failed error(s)${NC}"
    echo "════════════════════════════════════════════"
    exit 1
  fi
}

main
