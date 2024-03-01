import 'package:flutter/material.dart';

class SubTitleTextWidget extends StatelessWidget {
  const SubTitleTextWidget({
    super.key,
    required this.labe,
    this.fontSize = 18,
    this.color,
    this.maxLines,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.normal,
    this.textDecoration = TextDecoration.none,
  });

  final String labe;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;
  final Color? color;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      labe,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        fontStyle: fontStyle,
        decoration: textDecoration,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
