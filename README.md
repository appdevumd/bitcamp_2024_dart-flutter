# Flutter Bitcamp Demo

This is a very basic flutter app for the purpose of demonstrating how to get started with flutter. Follow the instructions below to install flutter, open the app's code using Visual Studio Code or Android Studio, and run the app.

![Frame 1](https://user-images.githubusercontent.com/98095976/230730040-a5ea8793-845f-4c93-9b1e-b62b2f8492d7.png)


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

On Windows, the PATH variable can be set by following these steps:

1. Open the Start menu and search for "Environment Variables".
2. Click on "Edit the system environment variables".
3. Click on the "Environment Variables" button.
4. In the "System variables" section, scroll down to the "Path" variable and click on "Edit".
5. Click on "New" and add the path to the `flutter/bin` directory.
6. Click on "OK" to save the changes.

On macOS or Linux, add the following line to your `.bashrc` or `.zshrc` file: ```export PATH="$PATH:/path/to/flutter/bin"```


#### Common Issues

- If you are using macOS and receive a message saying that the downloaded file is damaged and cannot be opened, try running the following command in a Terminal window: `xattr -r -d com.apple.quarantine ~/Downloads/flutter_macos_<version>.zip`

## Opening the App's Code

To open the app's code using Visual Studio Code or Android Studio, follow the instructions below:

### Using Visual Studio Code

1. Open Visual Studio Code.
2. Click on "Open folder" and select the folder containing the app's code.
3. Install the required extensions by clicking on the "Extensions" icon in the sidebar and searching for "Flutter" and "Dart".
4. Once the required extensions are installed, you can run the app by pressing `F5`.

### Using Android Studio

1. Open Android Studio.
2. Click on "File" > "Open" and select the folder containing the app's code.
3. Install the required plugins by going to "File" > "Settings" > "Plugins" and searching for "Flutter" and "Dart".
4. Once the required plugins are installed, you can run the app by clicking on the "Run" button in the toolbar.

## Running the App

Follow the instructions below to run the app:

1. Clone this repository using the command `git clone https://github.com/madamoniem/flutter_bitcamp_demo.git`.
2. Navigate to the project directory using the command cd flutter_bitcamp_demo.
3. Run the command flutter pub get to download the required dependencies.

Connect a physical device or start an emulator.

For instructions on setting up an Android emulator, see the official documentation.
For instructions on setting up an iOS simulator, see the official documentation.
Run the command flutter run to launch the app.

Common Issues
If you encounter an error that says "No devices found", make sure that your device or emulator is properly connected and recognized by your system.

If you encounter an error that says "Flutter plugin not installed", make sure that the Flutter and Dart plugins are properly installed in your IDE.

That's it! You should now have the app running on your device or emulator. Feel free to experiment with the code and make changes to the app. Happy coding!
