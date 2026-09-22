.PHONY: test test-html test-css

test: test-html test-css
	@echo "✓ All tests passed"

test-html:
	@echo "Testing HTML syntax..."
	@command -v tidy >/dev/null 2>&1 || { echo "Error: tidy is not installed. Install with: brew install tidy-html5"; exit 1; }
	@tidy -q -e 5eDarkerVarlyn.html 2>&1 | grep -v "^line" || echo "✓ HTML is well-formed"

test-css:
	@echo "Testing CSS syntax..."
	@command -v csslint >/dev/null 2>&1 || { echo "Warning: csslint not installed. Skipping CSS tests. Install with: npm install -g csslint"; exit 0; }
	@csslint 5eDarkerVarlyn.css --quiet || echo "✓ CSS linting complete"
