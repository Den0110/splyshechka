import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final Color color;
  final String imageUrl;
  final double size;
  final double padding;

  const Avatar({
    Key? key,
    required this.color,
    required this.imageUrl,
    required this.size,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
