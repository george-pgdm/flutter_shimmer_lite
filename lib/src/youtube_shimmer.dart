import 'package:flutter/material.dart';

import '_utils.dart';

class YoutubeShimmer extends StatelessWidget {
  final bool isDarkMode;
  final bool isPurplishMode;
  final bool hasCustomColors;
  final List<Color> colors;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color bgColor;

  const YoutubeShimmer({
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
  Widget build(BuildContext context) {
    // The actual animated gradient is provided by buildGradientDecoration in the widgets that use animation.
    // For a simple static layout demonstration, we will include three columns that other widgets animate.
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.width * 0.2,
                    color: Colors.transparent),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(width: 40, height: 40, color: Colors.transparent),
                    const SizedBox(width: 8),
                    Column(
                      children: [
                        Container(
                            width: 100, height: 8, color: Colors.transparent),
                        const SizedBox(height: 6),
                        Container(
                            width: 80, height: 8, color: Colors.transparent),
                      ],
                    )
                  ],
                )
              ],
            );
          }),
        )
      ],
    );
  }
}
