import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/core/localization/generated/l10n.dart';
import 'package:rick_and_morty/src/feature/character_details/presentation/widgets/custom_back_button.dart';
import 'package:rick_and_morty/src/feature/character_details/presentation/widgets/character_description.dart';
import 'package:rick_and_morty/src/feature/characters/data/models/character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CharacterImage(character.image),
          const SizedBox(height: 20),
          CharacterDescription(
            title: S.of(context).name,
            name: character.name,
            icon: Icons.abc_outlined,
          ),
          CharacterDescription(
            title: S.of(context).status,
            name: character.status,
            icon: Icons.abc_outlined,
          ),
          CharacterDescription(
            title: S.of(context).species,
            name: character.species,
            icon: Icons.abc_outlined,
          ),
          CharacterDescription(
            title: S.of(context).gender,
            name: character.gender,
            icon: Icons.abc_outlined,
          ),
        ],
      ),
    );
  }
}

class CharacterImage extends StatelessWidget {
  final String image;
  const CharacterImage(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1.46,
          child: Hero(
            tag: image,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const CustomBackButton(),
      ],
    );
  }
}
