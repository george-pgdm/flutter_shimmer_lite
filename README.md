# flutter_shimmer_lite

**Lightweight, dependency-free shimmer (skeleton) widgets for Flutter** — works seamlessly on Android, iOS, and Web. Drop in animated placeholders such as `TextShimmer`, `ProfileShimmer`, `VideoShimmer`, and more to improve **perceived loading performance**.

---

## ✨ Features

- ✅ Null-safe, pure Dart/Flutter (no native code or platform channels)
- 🎯 Lightweight and dependency-free
- ⚙️ Modular API — import only what you need
- 🎨 Highly customizable: dark mode, purplish theme, custom gradients, shapes
- 📱 Works on Android, iOS, and Web
- 🧪 Example app included for quick visual testing

---

## 🚀 Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_shimmer_lite: ^0.1.0

Then import it in your Dart code:

import 'package:flutter_shimmer_lite/flutter_shimmer_lite.dart';

Note: If developing locally, point to the package path:
dependencies:
  flutter_shimmer_lite:
    path: ../

⚡ Quick Usage
Simple Text Shimmer:
TextShimmer(
  text: 'Loading...',
  fontSize: 20,
)

Profile Placeholder:

ProfileShimmer(
  isRectBox: false,
  isDarkMode: false,
  hasBottomLines: true,
)
