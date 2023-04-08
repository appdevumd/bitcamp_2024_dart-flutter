# Flutter Bitcamp Demo

This is a very basic flutter app for the purpose of demonstrating how to get started with flutter. Follow the instructions below to install flutter and run the app.

## Prerequisites

Before proceeding, make sure you have the following installed:

- A computer running Windows, macOS, or Linux.
- A suitable text editor or integrated development environment (IDE) for coding, such as Android Studio or Visual Studio Code.
- Flutter SDK (version 2.2.3 or later)

## Installing the Prerequisites

### Install the Text Editor or IDE

You can use any text editor or IDE that you are comfortable with. Here are some popular options:

- **Android Studio**: [Download and install](https://developer.android.com/studio) Android Studio version 4.1 or later, which includes the Flutter plugin.
- **Visual Studio Code**: [Download and install](https://code.visualstudio.com/) Visual Studio Code version 1.50 or later, then install the [Flutter extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter).

### Install Flutter SDK

Follow the instructions below to install Flutter SDK:

1. Go to the [Flutter SDK download page](https://flutter.dev/docs/get-started/install).
2. Choose your operating system.
3. Click on the download button to download the latest stable release of Flutter SDK.
4. Extract the downloaded file in a suitable location for your development needs.
5. Add the `flutter/bin` directory to your system's PATH environment variable.

#### Common Issues

- If you are using macOS and receive a message saying that the downloaded file is damaged and cannot be opened, try running the following command in a Terminal window: `xattr -r -d com.apple.quarantine ~/Downloads/flutter_macos_<version>.zip`

## Running the App

Follow the instructions below to run the app:

1. Clone this repository using the command `git clone https://github.com/madamoniem/flutter_bitcamp_demo.git`.
2. Navigate to the project directory using the command `cd flutter_bitcamp_demo`.
3. Run `flutter pub get` to install the app's dependencies.
4. Connect your device or start an emulator.
5. Run the app using the command `flutter run`.

### Setting Up an Emulator

If you don't have a physical device to test the app on, you can use an emulator instead. Follow the instructions below to set up an emulator:

1. Open Android Studio.
2. Click on the "AVD Manager" icon in the toolbar, or go to "Tools" > "AVD Manager" in the menu bar.
3. Click on the "Create Virtual Device" button.
4. Choose a device definition and click on "Next".
5. Choose a system image and click on "Next".
6. Configure the device settings and click on "Finish".
7. Click on the "Play" button to start the emulator.

For more detailed instructions on running the app and setting up an emulator, see the [official documentation](https://flutter.dev/docs/get-started/test-drive).

### Troubleshooting

If you encounter any issues while installing or running the app, refer to the [official documentation](https://flutter.dev/docs/get-started) for help. You can also join the [Flutter community](https://flutter.dev/community) to get help from other developers.
