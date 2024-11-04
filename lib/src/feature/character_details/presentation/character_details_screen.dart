import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/src/core/enums/character_characteristic_enum.dart';
import 'package:rick_and_morty/src/core/localization/generated/l10n.dart';
import 'package:rick_and_morty/src/core/utils/get_icon_for_characteristic.dart';
import 'package:rick_and_morty/src/core/widgets/error_placeholder.dart';
import 'package:rick_and_morty/src/feature/character_details/presentation/widgets/custom_back_button.dart';
import 'package:rick_and_morty/src/feature/character_details/presentation/widgets/character_description.dart';
import 'package:rick_and_morty/src/feature/character_details/presentation/widgets/shimmer.dart';
import 'package:rick_and_morty/src/feature/character_details/store/character_store.dart';
import 'package:rick_and_morty/src/core/extension/string_extension.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final int id;
  const CharacterDetailsScreen(this.id, {super.key});

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  late final CharacterStore store;

  @override
  void initState() {
    super.initState();
    store = context.read<CharacterStore>();
    store.fetchCharacter(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return const CharacterDetailShimmer();
          }

          if (store.errorMessage.isNotNullOrEmpty) {
            return ErrorPlaceHolder(
              errorMessage: store.errorMessage ?? S.of(context).errorMessage,
              onTap: () => store.fetchCharacter(widget.id),
            );
          }

          final character = store.character;

          if (character != null) {
            return Column(
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
            );
          }

          return const SizedBox();
        },
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
