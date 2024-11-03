import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1,
      child: ColoredBox(color: Colors.grey),
    );
  }
}
