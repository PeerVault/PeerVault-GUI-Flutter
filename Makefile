run:
	flutter run

release:
	rm -rf /Applicationsbuild/macos/Build/Products/Release/
	flutter build macos --release
	codesign --deep --force --verbose --sign "6474BEC494BACEB22D23B3656F45F5BD7337552F" build/macos/Build/Products/Release/peervault.app

install:
	cp -r build/macos/Build/Products/Release/Peervault.app /Applications/