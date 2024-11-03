import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/feature/character_details/presentation/widgets/custom_back_button.dart';
import 'package:rick_and_morty/src/feature/character_details/presentation/widgets/character_description.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CharacterImage(),
          SizedBox(height: 20),
          CharacterDescription(
            title: 'Name',
            name: 'Betch Smith',
            icon: Icons.abc_outlined,
          ),
          CharacterDescription(
            title: 'Status',
            name: 'Alive',
            icon: Icons.abc_outlined,
          ),
          CharacterDescription(
            title: 'Species',
            name: 'Human',
            icon: Icons.abc_outlined,
          ),
          CharacterDescription(
            title: 'Gender',
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
