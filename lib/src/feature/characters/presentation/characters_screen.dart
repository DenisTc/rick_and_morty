import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/feature/characters/presentation/widgets/character_card.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({
    super.key,
  });

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final items = ['1', '2', '3', '4', '5'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .74,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 20.0,
          ),
          padding: const EdgeInsets.all(20.0),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return const CharacterCard();
          },
        ),
      ),
    );
  }
}
