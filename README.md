# Peervault - Client

A new Flutter project.

## Release instruction

### Build for MacOs

1. build macos

```
flutter build macos --releas
```

2. Sign with certificate from XCode
   2.1 Get a certificate from Xcode. The simplest step is to use Xcode, add a new certificate. 
       Read more about it here https://help.apple.com/xcode/mac/current/#/dev154b28f09
   
   2.2 Once you have the certificate you need to find the identity for it to sign your app. 
   ```
    security find-identity -p codesigning
   ```
   run this in terminal and copy hash it gives you against the certificate name you just created.

    2.3
    ```
      codesign --deep --force --verbose --sign "<identity>" build/macos
    ```
   
   2.4
   Verify the signature codesign --verify -vvvv Application.app and spctl -a -vvvv Application.app
   
 ## Dev followup
 
 - Structure directory for core service class
 - Splash loader for daemon loading and API check if owner exists
 - State with default settings (api url, ws url, p2p relay)