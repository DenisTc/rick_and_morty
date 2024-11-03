import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/core/theme/app_theme.dart';
import 'package:rick_and_morty/src/feature/characters/presentation/widgets/favorite_button.dart';
import 'package:rick_and_morty/src/feature/characters/presentation/widgets/image_card.dart';
import 'package:rick_and_morty/src/feature/characters/presentation/widgets/title_card.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: const ColoredBox(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ImageCard(),
                FavoriteButton(),
              ],
            ),
            SizedBox(height: 5),
            TitleCard(),
          ],
        ),
      ),
    );
  }
}
