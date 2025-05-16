import 'package:flutter/material.dart';

class AutoFadeOverflowText extends StatefulWidget {
  final String text;
  final TextStyle? style;

  const AutoFadeOverflowText({required this.text, this.style, super.key});

  @override
  _AutoFadeOverflowTextState createState() => _AutoFadeOverflowTextState();
}

class _AutoFadeOverflowTextState extends State<AutoFadeOverflowText> {
  bool _isOverflowing = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(text: widget.text, style: widget.style),
          maxLines: 1,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(minWidth: 0, maxWidth: double.infinity);

        _isOverflowing = textPainter.width > constraints.maxWidth;

        Widget textWidget = Text(
          widget.text,
          maxLines: 1,
          overflow: TextOverflow.clip,
          softWrap: false,
          style: widget.style,
        );

        if (!_isOverflowing) {
          return textWidget; // no fade needed
        }

        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.black,
                Colors.black,
                Colors.transparent,
              ],
              stops: [0.0, 0.85, 1.0],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: textWidget,
        );
      },
    );
  }
}
