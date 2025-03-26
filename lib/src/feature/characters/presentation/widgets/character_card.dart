import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/src/feature/character_details/presentation/character_details_screen.dart';
import 'package:rick_and_morty/src/feature/characters/data/models/character.dart';
import 'package:rick_and_morty/src/feature/characters/presentation/widgets/favorite_button.dart';
import 'package:rick_and_morty/src/feature/characters/presentation/widgets/image_card.dart';
import 'package:rick_and_morty/src/feature/characters/presentation/widgets/title_card.dart';
import 'package:rick_and_morty/src/feature/characters/store/characters_store.dart';

class CharacterCard extends StatefulWidget {
  final Character character;

  const CharacterCard({
    super.key,
    required this.character,
  });

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  late final CharactersStore store;

  @override
  void initState() {
    super.initState();
    store = context.read<CharactersStore>();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CharacterDetailsScreen(
                id: widget.character.id,
                image: widget.character.image,
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
                  ImageCard(widget.character.image),
                  FavoriteButton(
                    isFavorite: widget.character.isFavorite,
                    onTap: () => store.toggleLike(widget.character.id),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              TitleCard(widget.character.name),
            ],
          ),
        ),
      ),
    );
  }
}
