flutter_shimmer_lite

Lightweight, dependency-free shimmer (skeleton) widgets for Flutter — works on Android, iOS and Web. Drop in animated placeholders such as TextShimmer, ProfileShimmer, VideoShimmer and more to improve perceived loading performance.

Features

Null-safe, pure Dart/Flutter (no native code or platform channels)

Small, modular API — import only what you need

Customizable: dark mode, purplish theme, custom 3-color gradients, rectangular or circular shapes

Example app included for quick visual testing

Installation

Add to your pubspec.yaml:

dependencies:
  flutter_shimmer_lite: ^0.1.0


Then import:

import 'package:flutter_shimmer_lite/flutter_shimmer_lite.dart';


If developing locally, point the example or consuming project to the package path:

dependencies:
  flutter_shimmer_lite:
    path: ../

Quick usage

Simple text shimmer:

TextShimmer(
  text: 'Loading...',
  fontSize: 20,
)


Profile placeholder:

ProfileShimmer(
  isRectBox: false,
  isDarkMode: false,
  hasBottomLines: true,
)


Full example (mini):

import 'package:flutter/material.dart';
import 'package:flutter_shimmer_lite/flutter_shimmer_lite.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(home: const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('flutter_shimmer_lite demo')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextShimmer(text: 'Loading data...', fontSize: 26),
            SizedBox(height: 24),
            ProfileShimmer(hasBottomLines: true),
            SizedBox(height: 24),
            VideoShimmer(),
          ],
        ),
      ),
    );
  }
}

Widgets & Main Properties

Below are the primary widgets shipped in this package and the most useful properties.

TextShimmer

Animated gradient shader applied to text.

text — String (default '')

fontSize — double (default 14)

textStyle — TextStyle?

isDarkMode — bool

isPurplishMode — bool

hasCustomColors — bool

colors — List<Color> (3 colors)

begin, end — AlignmentGeometry

ProfileShimmer

Small profile layout with avatar and lines.

isRectBox, isPurplishMode, isDarkMode — bool

isDisabledAvatar — hide avatar

hasBottomLines — show additional lines below

padding, margin — layout spacing

hasCustomColors, colors — gradient control

bgColor — background color

ProfilePageShimmer

Larger profile header style. Wraps ProfileShimmer and adds page-like layout.

Similar props to ProfileShimmer

hasBottomBox — show bottom boxes (grid of cards)

VideoShimmer

Grid / row of rectangular video thumbnails.

isDarkMode, isPurplishMode, hasCustomColors, colors, padding, margin, bgColor

YoutubeShimmer

Skeleton for video thumbnails + metadata rows.

Same customization pattern as VideoShimmer

ListTileShimmer

List-tile style shimmer (avatar, two lines, optional button).

hideAvatar, hideButton, height

isRect, isDark, isPurplish, hasCustomColors, colors, padding, margin, bgColor

PlayStoreShimmer

Horizontal carousel of cards (app tiles skeleton).

isDarkMode, isPurplishMode, hasCustomColors, colors, padding, margin

Customization examples

Use a custom 3-color gradient:

ProfileShimmer(
  hasCustomColors: true,
  colors: [
    Color(0xFFEAEAEA),
    Color(0xFFCCCCCC),
    Color(0xFFEAEAEA),
  ],
);


Dark mode + purplish theme:

VideoShimmer(
  isDarkMode: true,
  isPurplishMode: true,
);


Change gradient direction:

TextShimmer(
  text: 'Loading',
  begin: Alignment.topLeft,
  end: Alignment.centerRight,
);


Note: When hasCustomColors is true, pass exactly three colors. The package falls back to sensible defaults otherwise.