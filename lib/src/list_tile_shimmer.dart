import 'package:flutter/material.dart';

import '../flutter_shimmer.dart';

class ListTileShimmer extends StatefulWidget {
  final bool isRect;
  final bool isDark;
  final bool isPurplish;
  final bool hideAvatar;
  final bool hideButton;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool hasCustomColors;
  final List<Color> colors;
  final double height;
  final Color bgColor;

  const ListTileShimmer({
    Key? key,
    this.isRect = false,
    this.isDark = false,
    this.isPurplish = false,
    this.hideAvatar = false,
    this.hideButton = false,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = const EdgeInsets.all(16.0),
    this.hasCustomColors = false,
    this.colors = freshDefaultColors,
    this.height = 0,
    this.bgColor = Colors.transparent,
  }) : super(key: key);

  @override
  _ListTileShimmerState createState() => _ListTileShimmerState();
}

class _ListTileShimmerState extends State<ListTileShimmer>
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

  BoxDecoration shapeDec({double radius = 0}) => buildGradientDecoration(
        animation: _anim,
        isRect: widget.isRect,
        isDark: widget.isDark,
        isPurplish: widget.isPurplish,
        hasCustomColors: widget.hasCustomColors,
        colors: widget.colors,
        borderRadius: radius,
      );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final circle = widget.height == 0 ? width * 0.1 : widget.height * 3;
    final newHeight = widget.height == 0 ? width * 0.05 : widget.height * 2;

    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) {
        return Container(
          margin: widget.margin,
          padding: widget.padding,
          color: widget.isDark ? const Color(0xFF0B0B0B) : widget.bgColor,
          child: Row(
            children: [
              if (!widget.hideAvatar)
                Container(
                    width: circle, height: circle, decoration: shapeDec()),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: width * 0.5,
                      height: newHeight,
                      decoration: shapeDec(radius: 6)),
                  const SizedBox(height: 8),
                  Container(
                      width: width * 0.45,
                      height: newHeight,
                      decoration: shapeDec(radius: 6)),
                ],
              ),
              const Spacer(),
              if (!widget.hideButton)
                Container(
                    width: width * 0.12,
                    height: newHeight,
                    decoration: shapeDec(radius: 6)),
            ],
          ),
        );
      },
    );
  }
}
