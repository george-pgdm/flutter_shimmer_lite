import 'package:flutter/material.dart';

import '../flutter_shimmer.dart';

class VideoShimmer extends StatefulWidget {
  final bool isDarkMode;
  final bool isPurplishMode;
  final bool hasCustomColors;
  final List<Color> colors;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color bgColor;

  const VideoShimmer({
    Key? key,
    this.isDarkMode = false,
    this.isPurplishMode = false,
    this.hasCustomColors = false,
    this.colors = freshDefaultColors,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = const EdgeInsets.all(16.0),
    this.bgColor = Colors.transparent,
  }) : super(key: key);

  @override
  _VideoShimmerState createState() => _VideoShimmerState();
}

class _VideoShimmerState extends State<VideoShimmer>
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

  BoxDecoration boxDec({bool rect = false}) => buildGradientDecoration(
        animation: _anim,
        isRect: rect,
        isDark: widget.isDarkMode,
        isPurplish: widget.isPurplishMode,
        hasCustomColors: widget.hasCustomColors,
        colors: widget.colors,
      );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final itemWidth = width * 0.25;
    final itemHeight = width * 0.2;

    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) {
        return Container(
          margin: widget.margin,
          padding: widget.padding,
          color: widget.isDarkMode ? const Color(0xFF0B0B0B) : widget.bgColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (i) {
              return Column(
                children: [
                  Container(
                      width: itemWidth,
                      height: itemHeight,
                      decoration: boxDec(rect: true)),
                  const SizedBox(height: 8),
                  Container(
                      height: 8,
                      width: itemWidth * 0.8,
                      decoration: boxDec(rect: true)),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
