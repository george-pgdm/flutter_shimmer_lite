import 'package:flutter/material.dart';

import '../flutter_shimmer.dart';

class PlayStoreShimmer extends StatefulWidget {
  final bool isDarkMode;
  final bool isPurplishMode;
  final bool hasCustomColors;
  final List<Color> colors;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color bgColor;

  const PlayStoreShimmer({
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
  _PlayStoreShimmerState createState() => _PlayStoreShimmerState();
}

class _PlayStoreShimmerState extends State<PlayStoreShimmer>
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

  BoxDecoration cardDec({double radius = 8}) => buildGradientDecoration(
        animation: _anim,
        isRect: true,
        isDark: widget.isDarkMode,
        isPurplish: widget.isPurplishMode,
        hasCustomColors: widget.hasCustomColors,
        colors: widget.colors,
        borderRadius: radius,
      );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cardSize = 110.0;

    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: widget.padding,
            margin: widget.margin,
            color: widget.isDarkMode ? const Color(0xFF0B0B0B) : widget.bgColor,
            child: Row(
              children: List.generate(6, (i) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: cardSize,
                          height: cardSize,
                          decoration: cardDec(radius: 25)),
                      const SizedBox(height: 10),
                      Container(
                          width: cardSize * 0.9,
                          height: width * 0.024,
                          decoration: cardDec(radius: 2)),
                      const SizedBox(height: 6),
                      Container(
                          width: 40,
                          height: width * 0.024,
                          decoration: cardDec(radius: 2)),
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
