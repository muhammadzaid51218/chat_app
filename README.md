# Flutter Chat App

A Future-Based Flutter Chat Application built using Riverpod and Firebase.  
This project follows a feature-based MVC architecture for scalability and maintainability.

---

## Overview

This Flutter app demonstrates a clean, scalable, and testable structure using:

- Riverpod for state management
- Firebase for authentication and real-time database
- Modular and feature-based architecture

---

## Features

- Firebase Authentication (Email and Password)
- Firestore Database for chat messages
- Light and Dark Theme support
- Clean Future-Based Folder Structure
- Riverpod State Management
- Reusable Widgets and Utility Classes

---

## Folder Structure

```
lib/
├── core/
│   ├── constants/              # App-wide constants and values
│   ├── services/               # API or Firebase service classes
│   ├── theme/                  # Light and Dark themes
│   ├── utils/                  # Helper functions and formatters
│   └── widgets/                # Reusable UI widgets
│
├── features/
│   ├── auth/                   # Authentication module
│   │   ├── data/               # Data layer (models, repos)
│   │   ├── presentation/       # UI + controllers
│   │   │   ├── controllers/
│   │   │   ├── pages/
│   │   │   └── widgets/
│   │   └── providers/          # Riverpod providers for auth
│   │
│   └── home/                   # Home/chat module
│       ├── data/
│       ├── presentation/
│       └── providers/
│
├── routes/                     # Navigation routes
├── firebase_options.dart       # Firebase configuration file
└── main.dart                   # Application entry point
```

---

## Firebase Setup

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project
3. Add Android and iOS apps
4. Download required config files:
    - `google-services.json` → place inside `android/app/`
    - `GoogleService-Info.plist` → place inside `ios/Runner/`
5. Run:
   ```
   flutterfire configure
   ```  
6. Ensure `firebase_options.dart` is correctly generated

---

## Packages Used

| Package          | Purpose                                         |
| ---------------- | ----------------------------------------------- |
| flutter_riverpod | State management                                |
| firebase_core    | Firebase initialization                         |
| firebase_auth    | User authentication                             |
| cloud_firestore  | Real-time database                              |
| google_fonts     | Custom typography                               |
| path_provider    | File system handling                            |
| uuid             | Unique ID generation                            |
| get              | Lightweight navigation and dependency injection |

---

## How to Run

1. Fetch all dependencies:
   ```
   flutter pub get
   ```  
2. Run the application:
   ```
   flutter run
   ```

---

## Theme Setup

Theme files are located in:

```
lib/core/theme/
├── light_theme.dart
├── dark_theme.dart
└── app_theme.dart
```

Configure theme mode in your main app file:

```
themeMode: ThemeMode.system
```

---

## Future Upgrades

- Push Notifications
- Group Chat Support
- User Profile Editing
- Message Encryption
- Media and File Sharing

---

## Author

**Muhammad Zaid**  
Beginner Flutter Developer — Building Scalable Apps  
GitHub: [github.com/MuhammadZaid](https://github.com/muhammadzaid51218)

---

## License

This project is open-source and available under the [MIT License](LICENSE).

---