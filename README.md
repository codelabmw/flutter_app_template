# FLUTTER APP TEMPLATE

A template repository for quickly getting started with flutter app dev environment setup.
This template uses `GetX` for state management, page routing and dependency injection. It also
uses `flutter_dotenv` for handling app secrets, `flutter_native_splash` to automatically generate
and register splash screen assets, `flutter_launcher_icons` to generate launcher icon assets and
`google_fonts` to manage fonts from google.

## Features

- [x] Installation and setup of commonly used packages.
- [x] Directory structure.
- [x] Common interfaces / contracts.
- [x] Common service implementations.
- [x] Common utility classes and functions.
- [x] Basic pages including: `Authentication`, `Onboarding`.

## Getting Started

Create a new repository from the template repository and then clone your created repository on your machine. Outlined below are customizations you should make to fit the theme and needs of your app.

### Change App ID

Make sure to change the app id for all your supported platforms before building your app for production. you can easily achieve this from your favorite editor with the find and replace feature or the equivalent. [Read more on deployment](<https://docs.flutter.dev/deployment>).

### Change App Name

Make sure to change the app name for all your supported platforms before building your app for production. [Read more on deployment](<https://docs.flutter.dev/deployment>).

### Launcher Icons

The template uses [flutter_launcher_icons](<https://pub.dev/packages/flutter_launcher_icons>) package to generate suitable launcher icon assets for different platforms. Replace the `assets/images/icon.png` with your own icon file.

To further customize the launcher assets / behavior you can change the `flutter_launcher_icons.yaml` config file. After customizations run the following command to generate your assets.

```shell
dart run flutter_launcher_icons
```

### Splash Screen

The template uses [flutter_native_splash](<https://pub.dev/packages/flutter_native_splash>) package to generate splash screen assets. Replace the files in the `assets/images/splash` directory with your custom assets.

To further customize the splash screen assets / behavior you can change the `flutter_native_splash.yaml` config file. After customizations run the following command to generate your assets.

```shell
dart run flutter_native_splash:create
```

### Fonts

The template uses [google_fonts](<https://pub.dev/packages/google_fonts>) package to load and use fonts from google. By default it uses the `Poppins` font family. You can add other fonts from google by downloading your preferred font family from the official [Google Fonts](<https://fonts.google.com>) website.

After the download, extract the zip file or copy the downloaded files into the `fonts` directory inside a designated subdirectory.

Add the font's license to flutter's license registry in `main.dart`.

``` dart
void main() async {
  // Other code
  // ...

  // Register Licenses
  // Poppins font license
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/Poppins/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(const App());
}
```

Change the `_textTheme` value inside the `lib/core/constants/app_theme.dart` file to globally change your app's font family.

``` dart
// Imports
// ...

abstract class AppTheme {
    // Other code
    // ...

    static final TextTheme _textTheme = GoogleFonts.poppinsTextTheme();

    // ...
}
```

### App Secrets

The template uses [flutter_dotenv](<https://pub.dev/packages/flutter_dotenv>) package to manage app secrets such as API keys. All you need to do is add a `.env` file inside the projects root directory. This file should not be source controlled, rather use the `.env.example` file to keep track of environment variable names you used in your `.env` file without specifying the values.

You can then create corresponding variables inside the `lib/core/constants/env.dart` file. Then in your code call the static variables you created using the `Env` class.

``` dart
// Imports
// ...

abstract class Env {
    static final apiKey = dotenv.get('MY_API_KEY', fallback: 'DEFAULT');
}
```

Then

``` dart
// Other code
//...

Future doSomethingWithApi() async {
    final response = await connectToApiFunction(key: Env.apiKey);
}

```

## Epilogue

After the above outlined customizations you can proceed to developing your app. The template follows a number of software developemt / design patterns and principles, we recommend you adopt this culture as well as it helps to easily scale and refactor your apps.

We hope you enyoy using the template and would love to hear your feedback. Connect with us on our socials and or official website. We are counting on your `⭐` ---- 😁.
