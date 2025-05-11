# Simple Counter App with Name and Counter Persistence

A basic Flutter application demonstrating navigation, and data persistence using `shared_preferences`.

## Features

* **Home Screen:** Displays a personalized greeting and a counter.
* **Name Input:** Allows the user to enter and save their name.
* **Persistence:** User's name and the counter value are saved locally using `shared_preferences` and persist across app sessions.
* **Dynamic UI:**
    * Increment and Decrement buttons are initially disabled until a name is set.
    * The greeting changes to show the saved name.
    * The "----" area is tappable to navigate to the name input screen when the name is not set.
* **Navigation:** Seamless navigation between the Home Screen and the Name Input Screen.
* **Input Validation:** The "Submit" button on the name input screen is disabled until text is entered.

## Design

The application's design is based on the following mockups:
![8b2ddfc8-f2bf-4a77-b14c-827a45ed4216](https://github.com/user-attachments/assets/bddbc1e0-ac0c-4f2b-8c0b-acc3e65c8d50)


## Technologies Used

* [Flutter](https://flutter.dev/) - UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
* [`shared_preferences`](https://pub.dev/packages/shared_preferences) - A Flutter plugin for reading and writing simple key-value pairs.


### Getting Started

1.  Clone the repository (or copy the code into your project):
    ```bash
    git clone https://github.com/ShishirRijal/Demo-Project
    cd Demo-Project
    ```

2.  Get the project dependencies:
    ```bash
    flutter pub get
    ```

3.  Run the application from your terminal:
    ```bash
    flutter run
    ```
    Alternatively, you can run the app directly from your IDE.
