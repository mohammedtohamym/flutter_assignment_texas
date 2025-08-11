# Texas Restaurant Mobile App

A modern Flutter-based mobile application for a restaurant ordering system with intuitive UI/UX, featuring menu browsing, cart management, user profiles, and favorites functionality.

![Flutter](https://img.shields.io/badge/Flutter-3.8.1-blue.svg)
![Dart](https://img.shields.io/badge/Dart-3.8.1-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

## Table of Contents

- [Features](#features)
- [Screenshots](#screenshots)
- [Project Structure](#project-structure)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
- [Configuration](#configuration)
- [Testing](#testing)
- [Known Issues](#known-issues)
- [Credits](#credits)

## Features

### Core Features

- **🏠 Home Dashboard** - Clean and intuitive main navigation
- **📱 Menu Browsing** - Category-wise food item display with search functionality
- **🛒 Shopping Cart** - Add/remove items with quantity management
- **❤️ Favorites System** - Save and manage favorite menu items
- **👤 User Profile** - Complete profile management with settings
- **🔔 Notifications** - In-app notification system

### Technical Features

- **Clean Architecture** - Organized codebase following SOLID principles
- **BLoC State Management** - Reactive state management with flutter_bloc
- **Responsive Design** - Adaptive UI using flutter_screenutil
- **Custom Fonts & Icons** - Brand-consistent typography and iconography
- **Dependency Injection** - Using get_it for better code organization
- **Network Connectivity** - Real-time connectivity status monitoring

## Screenshots

> **Note**: Screenshots will be uploaded to demonstrate the app's UI flow and key features.

### App Flow Screenshots

```
📱 Add screenshots here showing:
├── 🏠 Home/Landing Screen
├── 📋 Menu Categories & Items
├── 🛒 Shopping Cart Interface
├── ❤️ Favorites Collection
├── 👤 User Profile Screen
└── ⚙️ Settings & Preferences
```

_Screenshots showing the complete user journey from browsing to ordering_

## Project Structure

The project follows **Clean Architecture** principles with a feature-based organization:

```
lib/
├── app/                          # App-level configuration
├── core/                         # Shared utilities and resources
│   ├── di/                       # Dependency injection setup
│   └── resources/                # Colors, fonts, assets constants
├── data/                         # Data layer (repositories, models)
├── domain/                       # Business logic (entities, use cases)
├── presentation/                 # UI layer
│   ├── cubits/                   # Global state management
│   ├── pages/                    # Screen-specific components
│   │   └── main_home/            # Main navigation container
│   │       ├── tabs/             # Bottom navigation tabs
│   │       │   ├── menu/         # Menu browsing feature
│   │       │   └── profile/      # User profile feature
│   │       └── widgets/          # Reusable UI components
│   └── widgets/                  # Global reusable widgets
└── utils/                        # Utility functions and helpers
```

### Key Architectural Decisions

- **Feature-based structure** for scalability
- **Separation of concerns** with clear layer boundaries
- **Reusable components** for consistent UI
- **State management** isolated per feature

## Tech Stack

### Framework & Language

- **Flutter** `3.8.1` - Cross-platform mobile development
- **Dart** `3.8.1` - Programming language

### Core Dependencies

- **cupertino_icons** `1.0.8` - iOS-style icons and design elements
- **flutter_bloc** `9.1.1` - Reactive state management with BLoC pattern
- **flutter_screenutil** `5.9.3` - Responsive UI design across different screen sizes
- **dartz** `0.10.1` - Functional programming utilities (Either, Option types)
- **dio** `5.9.0` - Powerful HTTP client for API requests and interceptors
- **connectivity_plus** `6.1.4` - Network connectivity status monitoring
- **flutter_svg** `2.2.0` - SVG vector graphics support
- **get_it** `8.0.2` - Service locator for dependency injection
- **flutter_native_splash** `2.4.1` - Native splash screen generation

### Development Tools

- **flutter_lints** `5.0.0` - Code quality and style enforcement
- **flutter_test** - Built-in testing framework

### Architecture Patterns

- **BLoC Pattern** - Business Logic Component for state management
- **Clean Architecture** - Separation of concerns with clear layer boundaries
- **Dependency Injection** - Loose coupling with get_it service locator
- **Repository Pattern** - Data access abstraction layer

## Getting Started

### Prerequisites

Before running this project, ensure you have:

- **Flutter SDK** `>=3.8.1`
- **Dart SDK** `>=3.8.1`
- **Android Studio** or **VS Code** with Flutter extensions
- **Android SDK** (for Android development)
- **Xcode** (for iOS development - macOS only)

### Installation Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/mohammedtohamym/flutter_assignment_texas.git
   cd flutter_assignment_texas
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Generate splash screen** (if needed)

   ```bash
   flutter pub run flutter_native_splash:create
   ```

4. **Run the application**

   ```bash
   # For development
   flutter run

   # For specific platform
   flutter run -d android
   flutter run -d ios
   ```

### Build for Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS (requires macOS)
flutter build ios --release
```

## Configuration

### Development Setup

No additional configuration files are required for basic functionality. The app uses:

- **Mock data** for demonstration purposes
- **Local state management** for user preferences
- **Asset-based** icons and images

### Environment Variables

Currently, the app doesn't require external API keys or environment variables. A fake API is used and some data is mocked for demonstration purposes.

## Testing

Run the test suite using:

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/widget_test.dart
```

### Test Coverage

- No tests were made

## Known Issues / Limitations

### Current Limitations

- **Mock Data**: Uses static data and a fake API integration
- **Authentication**: No user authentication system implemented
- **Offline Support**: Limited offline functionality
- **Payment Integration**: No payment gateway integration

### Future Enhancements

- Real-time order tracking
- Push notifications
- Social login integration
- Multi-language support
- Dark mode theme

## Credits

### Design & Assets

- **Custom Icons**: SVG icons designed for brand consistency
- **Typography**: BERNIER and SpecialGothicCondensedOne fonts
- **Color Scheme**: Texas restaurant brand colors

### Dependencies

Special thanks to the Flutter community and package maintainers:

#### Core Packages

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) - Reactive state management with BLoC pattern
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) - Responsive design system
- [get_it](https://pub.dev/packages/get_it) - Service locator for dependency injection
- [dio](https://pub.dev/packages/dio) - HTTP client with interceptors and request/response transformation

#### UI & Graphics

- [flutter_svg](https://pub.dev/packages/flutter_svg) - SVG rendering support
- [cupertino_icons](https://pub.dev/packages/cupertino_icons) - iOS-style icon library
- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) - Native splash screen generation

#### Utilities & Functional Programming

- [dartz](https://pub.dev/packages/dartz) - Functional programming utilities
- [connectivity_plus](https://pub.dev/packages/connectivity_plus) - Network connectivity monitoring

#### Development Tools

- [flutter_lints](https://pub.dev/packages/flutter_lints) - Recommended lints for Flutter projects

---

## Development Notes

This project demonstrates:

- **Clean Architecture** implementation in Flutter
- **Professional UI/UX** design patterns
- **Scalable code structure** for enterprise applications
- **Modern Flutter development** practices and conventions

**Developed by**: Mohammed Tohamy  
**Repository**: [flutter_assignment_texas](https://github.com/mohammedtohamym/flutter_assignment_texas)

---

_This README was created for a Flutter developer technical assessment to showcase professional documentation standards and attention to detail._
