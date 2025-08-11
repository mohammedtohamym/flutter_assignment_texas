# Texas Restaurant Mobile App

A Flutter-based mobile application prototype for a restaurant ordering experience (technical assessment). Current focus: menu browsing, category & search filtering, cart handling, in‑memory favorites, and a mock profile screen.

![Flutter](https://img.shields.io/badge/Flutter-3.8.1-blue.svg)
![Dart](https://img.shields.io/badge/Dart-3.8.1-blue.svg)

<!-- License badge removed until a license file is added -->

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

### Implemented (Current State)

- **Menu Browsing** – Category extraction + search filtering using `MenuCubit`.
- **Shopping Cart (In‑Memory)** – Add / remove / quantity with transient overlay feedback via `CartCubit` (singleton in DI).
- **Favorites (In‑Memory)** – Toggled & filtered within `MenuCubit`; not persisted between sessions.
- **Profile Screen (Mock Data)** – Static (simulated) user info, menu items, switches & a notification badge count.
- **Basic Connectivity Check** – Single connectivity status check before fetching restaurant items.
- **Splash Screen Assets** – Configured via `flutter_native_splash` (generation command available).

### NOT Yet Implemented / Placeholder

- **Persistent Storage** (favorites, cart, profile) – All state resets on app restart.
- **Real-time Connectivity Monitoring** – No subscription to connectivity changes; only on-demand check.
- **Push / Local Notifications** – Notification badge is mock; no notification service integration.
- **Authentication / Authorization** – None.
- **Payment / Checkout Flow** – None.
- **Offline Caching** – None.

### Technical Characteristics

- **Layered Structure (Clean Architecture Inspired)** – `data / domain / presentation / core` separation.
- **State Management** – `flutter_bloc` cubits per feature + DI scoping (factory vs singleton).
- **Dependency Injection** – `get_it` with explicit registration in `dependency_injection.dart`.
- **Responsive Sizing** – `flutter_screenutil` wrapping `MaterialApp`.
- **Functional Constructs** – `dartz` Either for data source and repository error handling.
- **HTTP Client** – `dio` basic usage (no interceptors yet).
- **Custom Assets** – SVG icons & custom fonts (BERNIER, SpecialGothicCondensedOne).

## Screenshots

<img width="379" height="843" alt="Image" src="https://github.com/user-attachments/assets/69f7e436-9426-4b43-95cb-69ae567f93ce" />
<img width="374" height="830" alt="Image" src="https://github.com/user-attachments/assets/571ec157-e2b9-4140-9633-cbf0a6fdf55b" />

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

Current (reflects repository, simplified):

```
lib/
├── core/
│   ├── api/                  # API manager & constants
│   ├── di/                   # get_it registrations
│   ├── errors/               # Failure abstractions
│   └── resources/            # Colors, assets, styles
├── data/
│   ├── data_sources/remote/  # Remote data source impls
│   ├── model/                # DTOs
│   └── repositories/         # Repository implementations
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── use_cases/
├── presentation/
│   ├── cubits/               # App-wide cubits (e.g., Cart)
│   └── pages/main_home/
│       ├── tabs/
│       │   ├── home/
│       │   ├── menu/
│       │   ├── cart/
│       │   ├── more/
│       │   └── profile/
│       └── widgets/          # Main home specific widgets
├── utils/                    # Routing, helpers
└── main.dart
```

Notes:

- No global `presentation/widgets` directory (widgets are feature/local).
- Both `ApiEndpoints` and `ApiConstants` define endpoints; consider consolidating to a single source.

## Tech Stack

### Framework & Language

- **Flutter** `3.8.1` - Cross-platform mobile development
- **Dart** `3.8.1` - Programming language

### Core Dependencies (pubspec)

- **cupertino_icons** `^1.0.8`
- **flutter_bloc** `^9.1.1`
- **flutter_screenutil** `^5.9.3`
- **dartz** `^0.10.1`
- **dio** `^5.9.0` (basic GET usage; no interceptors configured yet)
- **connectivity_plus** `^6.1.4` (single pre-fetch check only)
- **flutter_svg** `^2.2.0`
- **get_it** `^8.0.2`
- **flutter_native_splash** `^2.4.1`

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

3. **Generate splash screen** (if you change the config)

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

Current prototype uses:

- **Remote menu items** fetched from `https://fakerestaurantapi.runasp.net/api` (see `ApiConstants.baseUrl`).
- **Mock profile data** (see `ProfileCubit`).
- **In-memory state only** (cart, favorites, switches not persisted).
- **Asset-based icons & custom fonts**.

### Environment Variables

Currently, the app does not require API keys. A public test API is queried for menu items; profile & some counts are mocked.

## Testing

Run the (placeholder) test suite using:

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/widget_test.dart
```

### Test Coverage / Status

- Only the default template `widget_test.dart` exists and is outdated (it tests a counter UI that is not part of the app). Replace with meaningful tests (menu fetch, filtering, cart operations) or delete until real tests are added.

## Known Issues / Limitations

### Current Limitations

- **State Persistence**: None (all volatile in-memory).
- **Notifications**: Badge count mock only; no actual push/local notifications.
- **Connectivity**: One-off check; no live subscription.
- **Authentication**: Not implemented.
- **Offline Support**: None / no caching.
- **Payment / Checkout**: Not implemented.
- **Testing**: Only placeholder default test present.
- **License File**: Not yet added (remove or add MIT before claiming license).
- **Duplicate Endpoint Definitions**: `ApiEndpoints` vs `ApiConstants` inconsistency.
- **Stray Folder**: `cubit copy` directory should be removed.

### Planned / Suggested Enhancements

- Real-time order tracking.
- Push / local notifications integration.
- Persistence layer (Hive / SharedPreferences) for cart & favorites.
- Authentication & user settings backend.
- Endpoint consolidation & HTTP interceptors (logging, auth, retry).
- Multi-language (intl) & dark mode support.
- Replace mock profile with real API + editable form.

## Credits

### Design & Assets

- **Custom Icons**: SVG icons (asset-based)
- **Typography**: BERNIER & SpecialGothicCondensedOne fonts
- **Color Scheme**: Texas-themed palette (see `AppColors`)

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

This prototype demonstrates:

- Layered (Clean Architecture-inspired) organization.
- Feature-scoped state management via cubits.
- Responsive layout setup.
- Asset & font integration.

It intentionally omits persistence, auth, full notification integration, and production-hardening concerns pending future iterations.

**Developed by**: Mohammed Tohamy  
**Repository**: [flutter_assignment_texas](https://github.com/mohammedtohamym/flutter_assignment_texas)

---

_This README reflects the current prototype state for a Flutter developer technical assessment. Sections will be expanded as features are implemented._
