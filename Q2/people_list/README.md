# Moovup Programming Test - Q2 (Dart & Flutter)

## Requirements
- Flutter version 3.19.2 (stable)
- Dart version 3.3.0 (stable)

# Compile
Run commands:
```
flutter pub get
```
For iOS only:
```
cd ios
pod install
```
```
flutter run
```

# Production Ready

## Android
1. Create a *key.properties* file and place it in *android* folder with content
2. <pre>storePassword=testing
keyPassword=testing
keyAlias=moovup_mobile
storeFile=C:\\Users\\jeffrey.leung\\Apps\\keys\\moovup-keystore.jks</pre>
3. Replace the corresponding values with the information of your keystore
4. Run ```flutter run --release``` to vertify it is working

## iOS
1. Set development team in *Signing & Capabilities* in *Xcode*
2. Select *Product* > *Archive*

# Screenshots
![screenshot_1](demo/screenshots/screenshot_1.png)
![screenshot_2](demo/screenshots/screenshot_2.png)
![screenshot_3](demo/screenshots/screenshot_3.png)
![screenshot_4](demo/screenshots/screenshot_4.png)
![screenshot_5](demo/screenshots/screenshot_5.png)
![screenshot_6](demo/screenshots/screenshot_6.png)
![screenshot_7](demo/screenshots/screenshot_7.png)
![screenshot_8](demo/screenshots/screenshot_8.png)
