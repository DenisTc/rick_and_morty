import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/feature/character_details/presentation/character_details_screen.dart';
import 'package:rick_and_morty/src/feature/characters/data/models/character.dart';
import 'package:rick_and_morty/src/feature/characters/presentation/widgets/favorite_button.dart';
import 'package:rick_and_morty/src/feature/characters/presentation/widgets/image_card.dart';
import 'package:rick_and_morty/src/feature/characters/presentation/widgets/title_card.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CharacterDetailsScreen(character),
            ),
          );
        },
        child: ColoredBox(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ImageCard(character.image),
                  FavoriteButton(),
                ],
              ),
              const SizedBox(height: 5),
              TitleCard(character.name),
            ],
          ),
        ),
      ),
    );
  }
}
