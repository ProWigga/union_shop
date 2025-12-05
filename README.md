# Union Shop — Flutter demo app

A small Flutter app that demonstrates core e-commerce flows (collections, product pages, responsive layout). This repository is a compact starter/demo app useful for coursework, prototyping, and learning Flutter cross-platform concepts.

---

## 1. Project title & description

- **Project title:** Union Shop
- **What it does:** A mobile-first Flutter app that displays product collections, product detail pages, and simple product cards. The app is built for web and mobile and includes basic widget tests.
- **Key features:**
  - Collection and product browsing
  - Product detail UI
  - Responsive layout for mobile and web
  - Basic automated widget tests

---

## 2. Installation & setup

### Prerequisites

- Flutter SDK (stable). Verify with `flutter doctor`.
- Git
- VS Code, Android Studio, or other editor of your choice

### Clone the repository

```powershell
git clone https://github.com/ProWigga/union_shop.git
cd union_shop
```

If you're using a fork, replace the URL above with your fork URL.

### Install dependencies

```powershell
flutter pub get
```

### Run the project

Run on Chrome (recommended for quick testing / mobile view):

```powershell
flutter run -d chrome
```

To run on a device or emulator, choose the target device in your editor or via `flutter devices` and run `flutter run`.

---

## 3. Usage

This section explains how to exercise the main features and flows of the app.

- Open the app and use the home/collections screens to browse available collections.
- Tap a product to open its product detail page and view images, price and description.
- Use the responsive layout in a browser (toggle device toolbar in DevTools) to see mobile vs desktop layouts.

### Important flows

- Collection browsing → Product list → Product details
- Add-ons such as cart, authentication or payments are not implemented in this example but can be added.

### Configuration

No runtime configuration is required to run the app. If you add services (e.g., Firebase), document required environment files or keys here.

---

## Tests

Widget tests exist under the `test/` directory. Run them with:

```powershell
flutter test
```

