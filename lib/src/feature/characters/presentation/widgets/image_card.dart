import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/core/constants/app_dimensions.dart';

class ImageCard extends StatelessWidget {
  final String image;
  const ImageCard(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Hero(
        tag: image,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppDimensions.borderRadius),
            topRight: Radius.circular(AppDimensions.borderRadius),
          ),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
            placeholder: (context, url) => const ColoredBox(
              color: Color(0xFFE0E0E0),
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            ),
            errorWidget: (context, url, error) => const ColoredBox(
              color: Color(0xFFE0E0E0),
              child: Center(
                child: Icon(Icons.broken_image_outlined, color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
