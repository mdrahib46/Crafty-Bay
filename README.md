# Crafty Bay - E-Commerce App

Crafty Bay is a dynamic and modern E-Commerce mobile application built with Flutter. It provides a seamless shopping experience with features ranging from product discovery to a complete checkout process.

## 🚀 Key Features

- **User Authentication**: Secure login and registration using Email & OTP (Pin Code) verification.
- **Home Dashboard**: Dynamic banners, categories, and highlighted product sections (Popular, New, Special).
- **Product Discovery**: Browse products by categories, view detailed product information, and read/write reviews.
- **Cart Management**: Add, remove, and manage items in the shopping cart with real-time updates.
- **Wishlist**: Save favorite products for later purchase.
- **State Management**: Robust and efficient state handling using the `Provider` package.
- **Localization**: Multi-language support (English & Bengali) using standard Flutter localization.
- **Networking**: Custom `NetworkCaller` service built on top of the `http` package for API interactions.
- **Loading States**: Shimmer effects for a polished user experience during data fetching.
- **Firebase Integration**: Includes Firebase Core, Analytics, and Crashlytics for performance monitoring.

## 🛠️ Tech Stack & Dependencies

- **Framework**: [Flutter](https://flutter.dev/) (SDK Version: 3.41.9)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **Networking**: [http](https://pub.dev/packages/http)
- **UI Components**: 
  - `carousel_slider` for dynamic banners.
  - `flutter_svg` for vector graphics.
  - `pin_code_fields` for OTP inputs.
  - `shimmer` for loading skeletons.
- **Media & Caching**: `cache_network_media` for efficient image loading.
- **Local Storage**: `shared_preferences`
- **Analytics & Monitoring**: `firebase_analytics`, `firebase_crashlytics`
- **Utilities**: `logger` for debugging, `email_validator` for form validation.
- **Localization**: `intl`, `flutter_localizations` (built-in)

## 📁 Project Structure

The project follows a modular, feature-based architecture to ensure code maintainability and scalability:

```text
lib/
├── app/                        # App-wide configurations and global logic
│   ├── controller/             # Business logic for app-wide states (e.g., AuthController)
│   ├── providers/              # Global ChangeNotifiers (Theme, Language)
│   ├── app_colors.dart         # Centralized color palette
│   ├── app_theme.dart          # Light and Dark theme definitions
│   ├── routes.dart             # Named routes and navigation logic
│   ├── asset_path.dart         # Constants for asset (SVG, PNG) paths
│   └── app_constant.dart       # General app constants (API keys, base URLs)
├── core/                       # Shared services and utilities
│   └── service/
│       └── network_caller/     # Custom HTTP client for API interactions
├── features/                   # Independent modules for each app feature
│   ├── auth/                   # Email & OTP verification, user profile
│   ├── home/                   # Home dashboard, banners, and categories
│   ├── product/                # Product lists, details, and reviews
│   ├── cart/                   # Shopping cart management
│   ├── category/               # Category-wise product filtering
│   ├── wish_list/              # User's saved favorite products
│   └── shared/                 # Common UI components used across features
│       ├── data/               # Shared models (e.g., UserModel, ProductModel)
│       └── presentation/       # Shared widgets and global UI state
├── l10n/                       # Localization (i18n) files
│   ├── app_en.arb              # English translation strings
│   └── app_bn.arb              # Bengali translation strings
└── main.dart                   # Root of the application
```

## ⚙️ Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
- Android Studio / VS Code with Flutter extensions.
- A connected device or emulator.

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/mdrahib46/Crafty-Bay.git
   cd Crafty-Bay
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup:**
   Ensure you have `firebase_options.dart` configured in the `lib/` directory or run `flutterfire configure`.

4. **Run the app:**
   ```bash
   flutter run
   ```

## 📝 License

This project is for educational purposes as part of the Ostad Flutter Batch 14.

---
*Crafty Bay - Shop with style.*
