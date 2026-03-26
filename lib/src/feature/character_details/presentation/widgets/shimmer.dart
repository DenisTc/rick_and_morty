import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/core/constants/app_dimensions.dart';
import 'package:shimmer/shimmer.dart';

class CharacterDetailShimmer extends StatelessWidget {
  const CharacterDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppDimensions.defaultPadding),
        ...List.generate(3, (index) => const _ShimmerRow()),
      ],
    );
  }
}

class _ShimmerRow extends StatelessWidget {
  const _ShimmerRow();

  static const _baseColor = Color(0xFFE0E0E0);
  static const _highlightColor = Color(0xFFF5F5F5);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.defaultPadding),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: _baseColor,
            highlightColor: _highlightColor,
            child: Container(
              width: AppDimensions.shimmerCircleSize,
              height: AppDimensions.shimmerCircleSize,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.defaultPadding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppDimensions.shimmerTextHeight,
                width: AppDimensions.shimmerTitleWidth,
                child: Shimmer.fromColors(
                  baseColor: _baseColor,
                  highlightColor: _highlightColor,
                  child: Container(color: Colors.white),
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                height: AppDimensions.shimmerTextHeight,
                width: AppDimensions.shimmerValueWidth,
                child: Shimmer.fromColors(
                  baseColor: _baseColor,
                  highlightColor: _highlightColor,
                  child: Container(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
