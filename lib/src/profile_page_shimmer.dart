import 'package:flutter/material.dart';

import '../flutter_shimmer.dart';

class ProfilePageShimmer extends StatelessWidget {
  final bool isRectBox;
  final bool isDarkMode;
  final bool isPurplishMode;
  final bool hasBottomBox;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool hasCustomColors;
  final List<Color> colors;
  final Color bgColor;
  final bool isDisabledAvatar;

  const ProfilePageShimmer({
    Key? key,
    this.isRectBox = false,
    this.isDarkMode = false,
    this.isPurplishMode = false,
    this.hasBottomBox = false,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = const EdgeInsets.all(16.0),
    this.hasCustomColors = false,
    this.colors = freshDefaultColors,
    this.bgColor = Colors.transparent,
    this.isDisabledAvatar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    return ProfileShimmer(
      isRectBox: isRectBox,
      isDarkMode: isDarkMode,
      isPurplishMode: isPurplishMode,
      isDisabledAvatar: isDisabledAvatar,
      hasBottomLines: false,
      padding: padding,
      margin: margin,
      hasCustomColors: hasCustomColors,
      colors: colors,
      bgColor: bgColor,
    );
  }
}
