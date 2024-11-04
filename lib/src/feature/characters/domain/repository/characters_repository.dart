import 'package:rick_and_morty/src/feature/characters/data/models/character_response.dart';

abstract interface class CharactersRepository {
  Future<CharacterResponse> getCharacters(int page);

  Future<List<String>> getFavoriteCharacterIds();

  Future<void> saveFavoriteCharacterIds(List<String> ids);
}
