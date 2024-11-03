import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/src/core/services/local_storage.dart';
import 'dart:convert';

import 'package:rick_and_morty/src/feature/characters/data/models/character.dart';

part 'characters_store.g.dart';

class CharactersStore = CharactersBase with _$CharactersStore;

abstract class CharactersBase with Store {
  CharactersBase() {
    _loadLikedCharacters();
  }

  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @observable
  ObservableSet<int> favoriteCharacterIds = ObservableSet<int>();

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

        final newCharacters = results.map((characterData) {
          final characterId = characterData['id'] as int;
          return Character.fromMap(
            characterData as Map<String, dynamic>,
            isFavorite: favoriteCharacterIds.contains(characterId),
          );
        }).toList();

        characters.addAll(newCharacters);
      } else {
        errorMessage = 'Failed to load characters';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    }
    isLoading = false;
  }

  @action
  Future<void> toggleLike(int characterId) async {
    if (favoriteCharacterIds.contains(characterId)) {
      favoriteCharacterIds.remove(characterId);
    } else {
      favoriteCharacterIds.add(characterId);
    }

    await _saveLikedCharacters();

    characters = ObservableList.of(characters.map((character) {
      if (character.id == characterId) {
        character.isFavorite = favoriteCharacterIds.contains(characterId);
      }
      return character;
    }));
  }

  Future<void> _loadLikedCharacters() async {
    final favoriteIds = LocalStorage().getFavoriteCharactersId();
    favoriteCharacterIds.addAll(favoriteIds.map(int.parse));
  }

  Future<void> _saveLikedCharacters() async {
    final ids = favoriteCharacterIds.map((id) => id.toString()).toList();
    await LocalStorage().saveFavoriteCharactersId(ids);
  }
}
