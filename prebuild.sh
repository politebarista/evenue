flutter clean
flutter pub get
flutter pub run flutter_native_splash:create --path=splash_screen_settings.yaml
flutter packages pub run build_runner build --delete-conflicting-outputs