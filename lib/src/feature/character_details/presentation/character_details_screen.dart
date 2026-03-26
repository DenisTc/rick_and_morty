import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_and_morty/src/core/constants/app_dimensions.dart';
import 'package:rick_and_morty/src/core/di/init_di.dart';
import 'package:rick_and_morty/src/core/enums/character_characteristic_enum.dart';
import 'package:rick_and_morty/src/core/localization/generated/l10n.dart';
import 'package:rick_and_morty/src/core/widgets/error_placeholder.dart';
import 'package:rick_and_morty/src/feature/character_details/presentation/widgets/custom_back_button.dart';
import 'package:rick_and_morty/src/feature/character_details/presentation/widgets/character_description.dart';
import 'package:rick_and_morty/src/feature/character_details/presentation/widgets/shimmer.dart';
import 'package:rick_and_morty/src/feature/character_details/store/character_store.dart';
import 'package:rick_and_morty/src/core/extension/string_extension.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final int id;
  final String image;

  const CharacterDetailsScreen({
    super.key,
    required this.id,
    required this.image,
  });

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  late final CharacterStore store;

  @override
  void initState() {
    super.initState();
    store = getIt<CharacterStore>();
    store.fetchCharacter(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CharacterImage(widget.image),
                const CharacterDetailShimmer(),
              ],
            );
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
                _CharacterImage(widget.image),
                const SizedBox(height: AppDimensions.defaultPadding),
                for (final entry in {
                  CharCharacteristicEnum.name: character.name,
                  CharCharacteristicEnum.status: character.status,
                  CharCharacteristicEnum.species: character.species,
                  CharCharacteristicEnum.gender: character.gender,
                }.entries)
                  CharacterDescription(
                    title: entry.key.title(context),
                    value: entry.value,
                    icon: entry.key.icon(entry.value).image(color: Colors.white),
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

class _CharacterImage extends StatelessWidget {
  final String image;
  const _CharacterImage(this.image);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: AppDimensions.imageDetailAspectRatio,
          child: Hero(
            tag: image,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppDimensions.borderRadius),
                topRight: Radius.circular(AppDimensions.borderRadius),
              ),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const ColoredBox(
                  color: Color(0xFFE0E0E0),
                  child: Center(
                    child: Icon(Icons.broken_image_outlined, color: Colors.grey, size: 48),
                  ),
                ),
              ),
            ),
          ),
        ),
        const CustomBackButton(),
      ],
    );
  }
}
