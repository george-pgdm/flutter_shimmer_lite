import 'package:flutter/material.dart';

const List<Color> freshDefaultColors = [
  Color.fromRGBO(0, 0, 0, 0.08),
  Color(0x44CCCCCC),
  Color.fromRGBO(0, 0, 0, 0.08),
];

const List<Color> freshTextDefaultColors = [
  Color.fromRGBO(0, 0, 0, 0.08),
  Color(0x44CCCCCC),
  Color.fromRGBO(0, 0, 0, 0.08),
];

/// Creates a gradient decoration for circular or rectangular shapes.
BoxDecoration buildGradientDecoration({
  required Animation<double> animation,
  bool isRect = false,
  bool isDark = false,
  bool isPurplish = false,
  bool hasCustomColors = false,
  List<Color> colors = freshDefaultColors,
  AlignmentGeometry begin = Alignment.topLeft,
  AlignmentGeometry end = Alignment.bottomRight,
  double borderRadius = 0,
}) {
  final used = (hasCustomColors && colors.length == 3)
      ? colors
      : [
          isPurplish
              ? const Color(0xFF8D71A9)
              : (isDark
                  ? const Color(0xFF1D1D1D)
                  : const Color.fromRGBO(0, 0, 0, 0.08)),
          isPurplish
              ? const Color(0xFF36265A)
              : (isDark ? const Color(0xFF3C4042) : const Color(0x44CCCCCC)),
          isPurplish
              ? const Color(0xFF8D71A9)
              : (isDark
                  ? const Color(0xFF1D1D1D)
                  : const Color.fromRGBO(0, 0, 0, 0.08)),
        ];

  // small safety clamps for stops
  double a = animation.value;
  double s0 = (a - 1.5).clamp(-10.0, 10.0);
  double s1 = (a).clamp(-10.0, 10.0);
  double s2 = (a + 1.5).clamp(-10.0, 10.0);

  return BoxDecoration(
    shape: isRect ? BoxShape.rectangle : BoxShape.circle,
    borderRadius:
        isRect && borderRadius > 0 ? BorderRadius.circular(borderRadius) : null,
    gradient: LinearGradient(
      begin: begin,
      end: end,
      colors: used,
      stops: [s0, s1, s2],
    ),
  );
}
