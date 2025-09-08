# flutter_shimmer_lite


**flutter_shimmer_lite** is a lightweight and customizable shimmer (skeleton loader) widget package for Flutter.  
It helps display animated loading placeholders to improve perceived performance while data is being fetched.  

Works seamlessly on **Android**, **iOS**, and **Web** — no native code required.

---

## ✨ Features

- Pure Dart/Flutter implementation (null-safe, dependency-free)
- Multiple ready-made shimmer widgets:
  - `TextShimmer`
  - `ProfileShimmer`
  - `ProfilePageShimmer`
  - `VideoShimmer`
  - `YoutubeShimmer`
  - `ListTileShimmer`
  - `PlayStoreShimmer`
- Customizable:
  - Dark mode and “purplish” theme
  - Your own gradient colors
  - Circular or rectangular shapes
  - Control animation direction
- Includes an `example/` app for quick testing

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_shimmer_lite: ^0.1.0
```

Then run:
```
flutter pub get
```
Import in your Dart code:

```
import 'package:flutter_shimmer_lite/flutter_shimmer_lite.dart';
```

🚀 Quick Usage
Text shimmer
```
TextShimmer(
  text: 'Loading...',
  fontSize: 20,
)
```
Profile shimmer with lines
```
ProfileShimmer(
  isRectBox: false,
  isDarkMode: false,
  hasBottomLines: true,
)
```

Video thumbnails shimmer
```
VideoShimmer(
  isDarkMode: true,
  hasCustomColors: true,
  colors: [
    Color(0xFFEAEAEA),
    Color(0xFFCCCCCC),
    Color(0xFFEAEAEA),
  ],
)
```
