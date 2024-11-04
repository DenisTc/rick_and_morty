import 'package:mobx/mobx.dart';

import 'package:rick_and_morty/src/feature/characters/data/models/character.dart';
import 'package:rick_and_morty/src/feature/characters/domain/usecases/get_characters.dart';
import 'package:rick_and_morty/src/feature/characters/domain/usecases/get_favorite_character_ids.dart';
import 'package:rick_and_morty/src/feature/characters/domain/usecases/save_favorite_character_ids.dart';

part 'characters_store.g.dart';

class CharactersStore = CharactersBase with _$CharactersStore;

abstract class CharactersBase with Store {
  final GetCharactesUseCase _getCharactes;
  final GetFavoriteCharacterIdsUseCase _getFavoriteCharacterIds;
  final SaveFavoriteCharacterIdsUseCase _saveFavoriteCharacterIds;

  CharactersBase({
    required GetCharactesUseCase getCharactes,
    required GetFavoriteCharacterIdsUseCase getFavoriteCharacterIds,
    required SaveFavoriteCharacterIdsUseCase saveFavoriteCharacterIds,
  })  : _getCharactes = getCharactes,
        _getFavoriteCharacterIds = getFavoriteCharacterIds,
        _saveFavoriteCharacterIds = saveFavoriteCharacterIds {
    _loadFavoriteCharacters();
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
      final response = await _getCharactes(page);
      final results = response.results;

      hasNextPage = response.info.next != null;

      if (isNextPage) {
        currentPage = page;
      }

      final newCharacters = results.map((characterData) {
        return characterData.copyWith(
          isFavorite: favoriteCharacterIds.contains(characterData.id),
        );
      }).toList();

      characters.addAll(newCharacters);
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

    await _saveFavoriteCharacters();

    characters = ObservableList.of(characters.map((character) {
      if (character.id == characterId) {
        character.isFavorite = favoriteCharacterIds.contains(characterId);
      }
      return character;
    }));
  }

  Future<void> _loadFavoriteCharacters() async {
    final favoriteIds = await _getFavoriteCharacterIds();
    favoriteCharacterIds.addAll(favoriteIds.map(int.parse));
  }

  Future<void> _saveFavoriteCharacters() async {
    final ids = favoriteCharacterIds.map((id) => id.toString()).toList();
    await _saveFavoriteCharacterIds(ids);
  }
}
