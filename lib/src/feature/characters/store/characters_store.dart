import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rick_and_morty/src/feature/characters/data/models/character.dart';

part 'characters_store.g.dart';

class CharactersStore = CharactersBase with _$CharactersStore;

abstract class CharactersBase with Store {
  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @observable
  bool isLoading = false;

  @observable
  bool hasNextPage = true;

  @observable
  int currentPage = 1;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchCharacters({bool isNextPage = false}) async {
    final page = isNextPage ? currentPage + 1 : currentPage;

    if (isNextPage && !hasNextPage) return;

    if (!isNextPage) {
      isLoading = true;
      errorMessage = null;
    }

    try {
      final response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character?page=$page'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final info = data['info'] as Map<String, dynamic>;
        final results = data['results'] as List;

        hasNextPage = info['next'] != null;

        if (isNextPage) {
          currentPage = page;
        }

        final newCharacters = results
            .map((characterData) =>
                Character.fromMap(characterData as Map<String, dynamic>))
            .toList();

        characters.addAll(newCharacters);
      } else {
        errorMessage = 'Failed to load characters';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    }
    isLoading = false;
  }
}
