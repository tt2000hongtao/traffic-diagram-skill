#!/bin/bash
# Validate SVG file for rsvg-convert compatibility
# Usage: ./scripts/validate-svg.sh <svg-file>

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <svg-file>"
  exit 1
fi

SVG_FILE="$1"

if [ ! -f "$SVG_FILE" ]; then
  echo "Error: File not found: $SVG_FILE"
  exit 1
fi

echo "Validating: $SVG_FILE"

# Check XML syntax
if ! xmllint --noout "$SVG_FILE" 2>/dev/null; then
  echo "FAIL: XML syntax error"
  xmllint --noout "$SVG_FILE" 2>&1
  exit 1
fi
echo "  XML syntax: OK"

# Check SVG root element
if ! grep -q '<svg' "$SVG_FILE"; then
  echo "FAIL: Missing <svg> root element"
  exit 1
fi
echo "  SVG root: OK"

# Check for external imports (breaks rsvg-convert)
if grep -q '@import' "$SVG_FILE"; then
  echo "WARN: Found @import - rsvg-convert cannot fetch external resources"
fi

# Check closing tag
if ! grep -q '</svg>' "$SVG_FILE"; then
  echo "FAIL: Missing </svg> closing tag"
  exit 1
fi
echo "  Closing tag: OK"

# Try rsvg-convert validation
if command -v rsvg-convert &>/dev/null; then
  if rsvg-convert "$SVG_FILE" -o /tmp/_validate_test.png 2>/dev/null; then
    echo "  rsvg-convert: OK"
    rm -f /tmp/_validate_test.png
  else
    echo "FAIL: rsvg-convert rendering error"
    rsvg-convert "$SVG_FILE" -o /tmp/_validate_test.png 2>&1
    exit 1
  fi
else
  echo "  rsvg-convert: SKIP (not installed)"
fi

echo "Validation PASSED"
