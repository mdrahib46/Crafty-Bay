# Crafty Bay - E-Commerce App

Crafty Bay is a dynamic and modern E-Commerce mobile application built with Flutter. It provides a seamless shopping experience with features ranging from product discovery to a complete checkout process.

## 🚀 Key Features

- **User Authentication**: Secure login and registration using Email & OTP (Pin Code).
- **Home Dashboard**: Dynamic banners, categories, and product highlights (Popular, New, Special).
- **Product Discovery**: Browse products by categories and view detailed product information.
- **Cart Management**: Add, remove, and manage items in the shopping cart with real-time price updates.
- **Wishlist**: Save favorite products for later purchase.
- **State Management**: Robust state handling using the `Provider` package.
- **Localization**: Multi-language support (i18n) for a global user base.
- **Networking**: Integrated with REST APIs for dynamic data fetching.
- **Firebase Integration**: Includes Firebase Analytics and Crashlytics for monitoring and performance tracking.

## 🛠️ Tech Stack & Dependencies

- **Framework**: [Flutter](https://flutter.dev/) (SDK Version: 3.41.9)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **Networking**: [http](https://pub.dev/packages/http)
- **UI Components**: 
  - `carousel_slider` for banners.
  - `flutter_svg` for vector graphics.
  - `pin_code_fields` for OTP inputs.
- **Local Storage**: `shared_preferences`
- **Analytics & Monitoring**: `firebase_analytics`, `firebase_crashlytics`
- **Localization**: `intl`, `flutter_localization`

## 📁 Project Structure

The project follows a feature-based architecture for better scalability and maintainability:

```text
lib/
├── app/                # App-wide configurations (Theme, Colors, Routes, Constants)
├── core/               # Core services (Network caller, Common utilities)
├── features/           # Feature-specific modules
│   ├── auth/           # Authentication flow
│   ├── home/           # Home screen & banners
│   ├── category/       # Category listing & navigation
│   ├── product/        # Product details & reviews
│   ├── cart/           # Cart management
│   ├── wish_list/      # Wishlist functionality
│   └── shared/         # Shared widgets & providers across features
├── l10n/               # Localization files
└── main.dart           # Entry point of the application
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
