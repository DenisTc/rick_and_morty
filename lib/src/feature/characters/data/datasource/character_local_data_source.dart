import 'package:rick_and_morty/src/core/services/local_storage.dart';

abstract interface class CharacterLocalDataSource {
  Future<void> saveFavoriteCharacterIds(List<String> ids);
  Future<List<String>> getFavoriteCharacterIds();
}

class CharacterLocalDataSourceImpl implements CharacterLocalDataSource {
  final LocalStorage api;

  CharacterLocalDataSourceImpl(this.api);

  @override
  Future<List<String>> getFavoriteCharacterIds() async {
    return api.getFavoriteCharactersId();
  }

  @override
  Future<void> saveFavoriteCharacterIds(List<String> ids) async {
    await api.saveFavoriteCharactersId(ids);
  }
}
