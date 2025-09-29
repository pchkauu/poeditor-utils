.PHONY: gen gen-app gen-remove

# Generate code for the whole workspace
gen: gen-remove gen-app

# Generate code for the root app
gen-app:
	dart pub run build_runner clean 
	dart pub run build_runner build

# Remove generated code
gen-remove:
	find . -type f \( -name "*.freezed.dart" -o -name "*.g.dart" -o -name "*.gr.dart" -o -name "*.config.dart" -o -name "*.gen.dart" -o -name "*.mocks.dart" \) -exec rm -f {} +
