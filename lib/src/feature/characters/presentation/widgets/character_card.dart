import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/src/core/constants/app_dimensions.dart';
import 'package:rick_and_morty/src/feature/character_details/presentation/character_details_screen.dart';
import 'package:rick_and_morty/src/feature/characters/data/models/character.dart';
import 'package:rick_and_morty/src/feature/characters/presentation/widgets/favorite_button.dart';
import 'package:rick_and_morty/src/feature/characters/presentation/widgets/image_card.dart';
import 'package:rick_and_morty/src/feature/characters/presentation/widgets/title_card.dart';
import 'package:rick_and_morty/src/feature/characters/store/characters_store.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    final store = context.read<CharactersStore>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CharacterDetailsScreen(
                id: character.id,
                image: character.image,
              ),
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
                  Observer(
                    builder: (_) {
                      final isFavorite =
                          store.favoriteCharacterIds.contains(character.id);
                      return FavoriteButton(
                        isFavorite: isFavorite,
                        onTap: () => store.toggleLike(character.id),
                      );
                    },
                  ),
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
