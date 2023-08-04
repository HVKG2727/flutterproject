
# First Flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project Tasks

The First Flutter project aims to achieve the following tasks:

1. **User Authentication**: Implement a basic login screen where users can register or log in via email and password using Firebase authentication.

2. **Display Data from API**: Create a screen to fetch and display a list of data from a mock REST API (e.g., JSONPlaceholder) with typical JSON responses. The data will be displayed in a list view.

3. **Add New Data**: Implement functionality to post new data to the API. Users can add a new post or comment (depending on the API endpoints available).

4. **Detail Screen**: Tapping an item on the list will navigate the user to a detail screen that presents more information about that item.

5. **Local Persistence**: The app will cache the data locally so that it can still display information even if it goes offline.

## Getting Started

To build and run the project, follow these steps:

1. **Install Flutter**: If you haven't already, [install Flutter](https://flutter.dev/docs/get-started/install) on your development environment.

2. **Clone the Repository**: Clone this repository using Git to your local machine.

3. **Set up Firebase**: Create a new project in the [Firebase console](https://console.firebase.google.com/). Follow the steps to set up Firebase Authentication and get your Firebase configuration details. Add the configuration details to your `pubspec.yaml` file.

4. **Install Dependencies**: Run `flutter pub get` in the project directory to install all the required dependencies.

5. **Run the App**: Connect a device or use an emulator, and run the app using the `flutter run` command.

## Libraries Used

The project uses the following libraries:

- [Firebase Auth](https://pub.dev/packages/firebase_auth): For user authentication using Firebase.
- [http](https://pub.dev/packages/http): For making API requests to fetch and post data.
- [provider](https://pub.dev/packages/provider): For state management.
- [sqflite](https://pub.dev/packages/localstorage): For local data persistence.

## Folder Structure

The project follows a common Flutter folder structure:

