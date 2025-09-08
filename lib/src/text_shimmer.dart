import 'package:flutter/material.dart';

import '_utils.dart';

class TextShimmer extends StatefulWidget {
  final String text;
  final double fontSize;
  final TextStyle? style;
  final bool isDarkMode;
  final bool isPurplishMode;
  final bool hasCustomColors;
  final List<Color> colors;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const TextShimmer({
    Key? key,
    this.text = '',
    this.fontSize = 14,
    this.style,
    this.isDarkMode = false,
    this.isPurplishMode = false,
    this.hasCustomColors = true,
    this.colors = freshTextDefaultColors,
    this.begin = Alignment.topLeft,
    this.end = Alignment.centerRight,
  }) : super(key: key);

  @override
  _TextShimmerState createState() => _TextShimmerState();
}

class _TextShimmerState extends State<TextShimmer>
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

  @override
  Widget build(BuildContext context) {
    final text = widget.text.isEmpty ? ' ' : widget.text;
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) {
        final colors = (widget.hasCustomColors && widget.colors.length == 3)
            ? widget.colors
            : [
                widget.isPurplishMode
                    ? const Color(0xFF8D71A9)
                    : (widget.isDarkMode
                        ? const Color(0xFF1D1D1D)
                        : const Color.fromRGBO(0, 0, 0, 0.08)),
                widget.isPurplishMode
                    ? const Color(0xFF36265A)
                    : (widget.isDarkMode
                        ? const Color(0xFF3C4042)
                        : const Color(0x44CCCCCC)),
                widget.isPurplishMode
                    ? const Color(0xFF8D71A9)
                    : (widget.isDarkMode
                        ? const Color(0xFF1D1D1D)
                        : const Color.fromRGBO(0, 0, 0, 0.08)),
              ];

        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: widget.begin,
              end: widget.end,
              colors: colors,
              stops: [
                (_anim.value - 1.0).clamp(-4.0, 4.0),
                (_anim.value).clamp(-4.0, 4.0),
                (_anim.value + 1.0).clamp(-4.0, 4.0),
              ],
            ).createShader(bounds);
          },
          child: Text(text,
              style: widget.style ??
                  TextStyle(fontSize: widget.fontSize, color: Colors.white)),
        );
      },
    );
  }
}
