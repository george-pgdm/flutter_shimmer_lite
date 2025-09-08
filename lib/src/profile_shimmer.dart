import 'package:flutter/material.dart';

import '../flutter_shimmer.dart';

class ProfileShimmer extends StatefulWidget {
  final bool isRectBox;
  final bool isDarkMode;
  final bool isPurplishMode;
  final bool isDisabledAvatar;
  final bool hasBottomLines;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool hasCustomColors;
  final List<Color> colors;
  final Color bgColor;

  const ProfileShimmer({
    Key? key,
    this.isRectBox = false,
    this.isDarkMode = false,
    this.isPurplishMode = false,
    this.isDisabledAvatar = false,
    this.hasBottomLines = false,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = const EdgeInsets.all(16.0),
    this.hasCustomColors = false,
    this.colors = freshDefaultColors,
    this.bgColor = Colors.transparent,
  }) : super(key: key);

  @override
  _ProfileShimmerState createState() => _ProfileShimmerState();
}

class _ProfileShimmerState extends State<ProfileShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat();
    _anim = Tween<double>(begin: -2, end: 2)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  BoxDecoration dec() => buildGradientDecoration(
        animation: _anim,
        isRect: widget.isRectBox,
        isDark: widget.isDarkMode,
        isPurplish: widget.isPurplishMode,
        hasCustomColors: widget.hasCustomColors,
        colors: widget.colors,
      );

  BoxDecoration lineDec() => buildGradientDecoration(
        animation: _anim,
        isRect: true,
        isDark: widget.isDarkMode,
        isPurplish: widget.isPurplishMode,
        hasCustomColors: widget.hasCustomColors,
        colors: widget.colors,
        borderRadius: 6,
      );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) {
        return Container(
          margin: widget.margin,
          padding: widget.padding,
          color: widget.isDarkMode ? const Color(0xFF0B0B0B) : widget.bgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (!widget.isDisabledAvatar)
                    Container(
                      width: width * 0.14,
                      height: width * 0.14,
                      decoration: dec(),
                    ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: width * 0.3,
                          height: height * 0.008,
                          decoration: lineDec()),
                      const SizedBox(height: 8),
                      Container(
                          width: width * 0.2,
                          height: height * 0.006,
                          decoration: lineDec()),
                      const SizedBox(height: 8),
                      Container(
                          width: width * 0.4,
                          height: height * 0.007,
                          decoration: lineDec()),
                    ],
                  )
                ],
              ),
              if (widget.hasBottomLines) ...[
                const SizedBox(height: 20),
                Container(
                    height: height * 0.006,
                    width: width * 0.7,
                    decoration: lineDec()),
                const SizedBox(height: 8),
                Container(
                    height: height * 0.006,
                    width: width * 0.8,
                    decoration: lineDec()),
                const SizedBox(height: 8),
                Container(
                    height: height * 0.006,
                    width: width * 0.5,
                    decoration: lineDec()),
              ]
            ],
          ),
        );
      },
    );
  }
}
