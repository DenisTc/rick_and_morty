import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/core/icons/gen/assets.gen.dart';
import 'package:rick_and_morty/src/core/theme/app_theme.dart';

class CharacterDescription extends StatelessWidget {
  final String title;
  final String name;
  final IconData icon;

  const CharacterDescription({
    super.key,
    required this.title,
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20.0,
            backgroundColor: AppTheme.irisBlue,
            child: Assets.icons.characterSpecies.alien.image(
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  name,
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
