import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'package:rick_and_morty/src/core/network/app_exception.dart';
import 'package:rick_and_morty/src/feature/characters/data/models/character.dart';
import 'package:rick_and_morty/src/feature/characters/domain/usecases/get_characters.dart';
import 'package:rick_and_morty/src/feature/characters/domain/usecases/get_favorite_character_ids.dart';
import 'package:rick_and_morty/src/feature/characters/domain/usecases/save_favorite_character_ids.dart';

part 'characters_store.g.dart';

@singleton
class CharactersStore = CharactersBase with _$CharactersStore;

abstract class CharactersBase with Store {
  final GetCharactersUseCase _getCharacters;
  final GetFavoriteCharacterIdsUseCase _getFavoriteCharacterIds;
  final SaveFavoriteCharacterIdsUseCase _saveFavoriteCharacterIds;

  CharactersBase({
    required GetCharactersUseCase getCharacters,
    required GetFavoriteCharacterIdsUseCase getFavoriteCharacterIds,
    required SaveFavoriteCharacterIdsUseCase saveFavoriteCharacterIds,
  })  : _getCharacters = getCharacters,
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
      characters.clear();
    }

    try {
      final response = await _getCharacters(page);

      hasNextPage = response.info.next != null;

      if (isNextPage) {
        currentPage = page;
      }

      characters.addAll(response.results);
    } on AppException catch (e) {
      errorMessage = e.message;
    } catch (_) {
      errorMessage = 'Something went wrong';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> toggleLike(int characterId) async {
    if (favoriteCharacterIds.contains(characterId)) {
      favoriteCharacterIds.remove(characterId);
    } else {
      favoriteCharacterIds.add(characterId);
    }

    await _saveFavoriteCharacters();
  }

  Future<void> _loadFavoriteCharacters() async {
    final favoriteIds = await _getFavoriteCharacterIds();
    final parsed = favoriteIds
        .map(int.tryParse)
        .whereType<int>();
    favoriteCharacterIds.addAll(parsed);
  }

  Future<void> _saveFavoriteCharacters() async {
    final ids = favoriteCharacterIds.map((id) => id.toString()).toList();
    await _saveFavoriteCharacterIds(ids);
  }
}
