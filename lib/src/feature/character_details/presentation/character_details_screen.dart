import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/core/enums/character_characteristic_enum.dart';
import 'package:rick_and_morty/src/core/localization/generated/l10n.dart';
import 'package:rick_and_morty/src/core/utils/get_icon_for_characteristic.dart';
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
            value: character.name,
            icon: getIconForCharacteristic(
              typeEnum: CharCharacteristicEnum.gender,
              value: character.name,
            ).image(color: Colors.white),
          ),
          CharacterDescription(
            title: S.of(context).status,
            value: character.status,
            icon: getIconForCharacteristic(
              typeEnum: CharCharacteristicEnum.status,
              value: character.status,
            ).image(color: Colors.white),
          ),
          CharacterDescription(
            title: S.of(context).species,
            value: character.species,
            icon: getIconForCharacteristic(
              typeEnum: CharCharacteristicEnum.species,
              value: character.species,
            ).image(color: Colors.white),
          ),
          CharacterDescription(
            title: S.of(context).gender,
            value: character.gender,
            icon: getIconForCharacteristic(
              typeEnum: CharCharacteristicEnum.gender,
              value: character.gender,
            ).image(color: Colors.white),
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
