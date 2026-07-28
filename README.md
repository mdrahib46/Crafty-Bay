# Crafty Bay - Modern E-Commerce Solution

[![Flutter](https://img.shields.io/badge/Flutter-3.41.9-02569B?logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev/)
[![Provider](https://img.shields.io/badge/State-Provider-blue)](https://pub.dev/packages/provider)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

Crafty Bay is a sophisticated E-Commerce mobile application built with Flutter, demonstrating industry-standard practices in modular architecture, state management, and user experience. It provides a full shopping lifecycle from authentication to secure checkout.

---

## 📸 Application UI

<p align="center">
  <img src="assets/images/crafty_bay.png" width="800" alt="Crafty Bay UI Overview"/>
</p>

---

#

## 💡 Technical Highlights

Recent updates focus on **scalability**, **developer efficiency**, and **community engagement**:

*   **🛡️ Global Auth & Networking**: Integrated a centralized `NetworkCaller` that handles token injection and automatic logout on session expiration (401 Unauthorized), ensuring a secure and seamless user experience.
*   **⭐ Product Review System**: Implemented a complete review lifecycle allowing users to share feedback and rate products, integrated with a reactive UI for real-time updates.
*   **🌍 Advanced Localization (i18n)**: Implemented full multi-language support (English & Bengali) using `.arb` files and custom `BuildContext` extensions for zero-boilerplate translation access (`context.localization.key`).
*   **🌓 Adaptive UI**: Comprehensive support for Light and Dark modes, managed via a global `ThemeModeProvider` and standardized `AppTheme`.
*   **🛠️ Clean Routing**: Transitioned to a robust `onGenerateRoute` pattern for better navigation control and dynamic argument handling.
*   **🧩 Feature-First Architecture**: Refactored the project into a modular structure where each feature (Auth, Cart, Product, Review, etc.) is self-contained with its own data and presentation layers.

---

## 🏗 Architecture & Engineering

For senior developers, Crafty Bay follows a **Feature-Based Modular Architecture**. This ensures that the codebase remains maintainable as the project grows.

### Design Principles:
-   **Separation of Concerns**: UI (Presentation), Logic (Provider), and Data (Models/DTOs) are strictly separated.
-   **Service-Oriented Networking**: A custom-built `NetworkCaller` handles all HTTP traffic, ensuring consistent error handling, logging, and token management.
-   **Centralized Resource Management**: Assets, colors, and themes are managed in the `app/` directory to maintain design consistency.

### 🔐 Authentication & Security
- **Email & OTP Flow**: Secure login using Email with Pin Code verification.
- **Persistent Sessions**: User authentication state is managed and persisted using `SharedPreferences` and an `AuthController`.

### 🏠 Shopping Experience
- **Dynamic Home**: Interactive carousels, category-based browsing, and "Special/New/Popular" product segments.
- **Product Insights**: Detailed product pages with size/color selection and community reviews.
- **Wishlist & Cart**: Real-time management of shopping cart and favorites with state persistence.

---

## 🎨 Customization & Assets

You can customize the application's branding and visuals easily:

### Branded Assets
- **Logo**: Replace `assets/images/logo.svg` with your brand logo.
- **Launch Screen**: You can customize the launch screen with your own desired assets by replacing the image files in `ios/Runner/Assets.xcassets/LaunchImage.imageset/`. You can also do it by opening your Flutter project's Xcode project with `open ios/Runner.xcworkspace`, selecting `Runner/Assets.xcassets` in the Project Navigator and dropping in the desired images.

### Theme & Colors
- **Primary Color**: Update `AppColors.themeColor` in `lib/app/app_colors.dart` to change the global accent color.
- **Typography**: Adjust `AppTheme` in `lib/app/app_theme.dart` to modify fonts and text styles across the app.

---

## 📂 Project Structure (Deep Dive)

Crafty Bay follows a **Modular Feature-based Architecture**, making it easy for senior developers to scale and junior developers to navigate. This structure ensures a clean separation between business logic, data handling, and UI presentation.

```text
lib/
├── app/                        # Global App Configuration & Resources
│   ├── controller/             # Global Business Logic (Auth, etc.)
│   ├── extensions/             # Dart Extensions (Localization, UI)
│   ├── providers/              # App-wide State (Theme, Language)
│   ├── app_colors.dart         # Centralized Color Palette
│   ├── app_theme.dart          # Standardized Light/Dark Themes
│   ├── asset_path.dart         # Image/Icon path constants
│   ├── routes.dart             # Dynamic Route Generation
│   └── urls.dart               # API Endpoints configuration
├── core/                       # Shared Infrastructure & Services
│   └── service/                # Core Services
│       └── network_caller/     # Advanced HTTP Client with Interceptors
├── features/                   # Independent Business Modules
│   ├── auth/                   # Identity & Access Management
│   ├── category/               # Category Discovery & Filtering
│   ├── home/                   # Dashboard, Carousels & Segments
│   ├── product/                # Product Catalog, Details & Reviews
│   ├── cart/                   # Shopping Cart Logic & UI
│   ├── wish_list/              # Favorites Management
│   └── shared/                 # Feature-specific shared widgets & models
├── l10n/                       # Internationalization (i18n)
└── main.dart                   # Root Entry Point
```

---

## 🛠 Tech Stack

| Category | Tools/Libraries |
| :--- | :--- |
| **Framework** | [Flutter](https://flutter.dev/) (3.41.9) |
| **State Management** | [Provider](https://pub.dev/packages/provider) |
| **Network** | `http`, Custom `NetworkCaller` |
| **UI/UX** | `carousel_slider`, `flutter_svg`, `shimmer`, `pin_code_fields` |
| **Storage** | `shared_preferences` |
| **Monitoring** | `firebase_analytics`, `firebase_crashlytics` |
| **Localization** | `intl`, `flutter_localizations` |

---

## ⚙️ Setup & Installation

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Android Studio / VS Code
- Firebase Project setup

### Steps
1. **Clone the repository:**
   ```bash
   git clone https://github.com/mdrahib46/Crafty-Bay.git
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Firebase Setup:**
   Run `flutterfire configure` or add your `google-services.json` / `GoogleService-Info.plist`.
4. **Run the application:**
   ```bash
   flutter run
   ```

---

## 🙏 Acknowledgements

Special thanks to [Rafat Meraz](https://www.linkedin.com/in/rafatjamadermaraz/) for his outstanding mentorship and guidance throughout this Flutter learning journey. I also sincerely appreciate **Ostad** and the entire **Ostad team** for providing an excellent learning platform and continuous support that made this project possible.


---
*Crafty Bay - Shop with style.*
