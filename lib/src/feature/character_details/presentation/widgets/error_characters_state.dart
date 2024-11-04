import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/core/localization/generated/l10n.dart';
import 'package:rick_and_morty/src/feature/characters/store/characters_store.dart';

class ErrorCharactersState extends StatelessWidget {
  const ErrorCharactersState({
    super.key,
    required this.store,
  });

  final CharactersStore store;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(store.errorMessage ?? ''),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                store.fetchCharacters();
              },
              child: Text(
                S.of(context).reload,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
