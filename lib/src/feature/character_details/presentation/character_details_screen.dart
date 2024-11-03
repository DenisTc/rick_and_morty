import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/core/localization/generated/l10n.dart';
import 'package:rick_and_morty/src/feature/character_details/presentation/widgets/custom_back_button.dart';
import 'package:rick_and_morty/src/feature/character_details/presentation/widgets/character_description.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CharacterImage(),
          const SizedBox(height: 20),
          CharacterDescription(
            title: S.of(context).name,
            name: 'Betch Smith',
            icon: Icons.abc_outlined,
          ),
          CharacterDescription(
            title: S.of(context).status,
            name: 'Alive',
            icon: Icons.abc_outlined,
          ),
          CharacterDescription(
            title: S.of(context).species,
            name: 'Human',
            icon: Icons.abc_outlined,
          ),
          CharacterDescription(
            title: S.of(context).gender,
            name: 'Male',
            icon: Icons.abc_outlined,
          ),
        ],
      ),
    );
  }
}

class CharacterImage extends StatelessWidget {
  const CharacterImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        AspectRatio(
          aspectRatio: 1.46,
          child: ColoredBox(color: Colors.grey),
        ),
        CustomBackButton(),
      ],
    );
  }
}
