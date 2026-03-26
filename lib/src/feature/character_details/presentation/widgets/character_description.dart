import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/core/constants/app_dimensions.dart';
import 'package:rick_and_morty/src/core/theme/app_theme.dart';

class CharacterDescription extends StatelessWidget {
  final String title;
  final String value;
  final Widget icon;

  const CharacterDescription({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.defaultPadding,
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: AppDimensions.circleAvatarRadius,
            backgroundColor: AppTheme.irisBlue,
            child: icon,
          ),
          const SizedBox(width: AppDimensions.defaultPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
