run:
	flutter run

release:
	rm -rf /Applicationsbuild/macos/Build/Products/Release/
	flutter build macos --release
	cp peervault build/macos/Build/Products/Release/Peervault.app/Contents/MacOS/io.plab.peervault
	codesign --deep --force --verbose --sign "6474BEC494BACEB22D23B3656F45F5BD7337552F" build/macos/Build/Products/Release/Peervault.app

install:
	cp -r build/macos/Build/Products/Release/Peervault.app /Applications/