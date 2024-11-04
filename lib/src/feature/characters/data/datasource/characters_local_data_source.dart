import 'package:rick_and_morty/src/core/services/local_storage.dart';

abstract interface class CharactersLocalDataSource {
  Future<void> saveFavoriteCharacterIds(List<String> ids);
  Future<List<String>> getFavoriteCharacterIds();
}

class CharactersLocalDataSourceImpl implements CharactersLocalDataSource {
  final LocalStorage api;

  CharactersLocalDataSourceImpl(this.api);

  @override
  Future<List<String>> getFavoriteCharacterIds() async {
    return api.getFavoriteCharactersId();
  }

  @override
  Future<void> saveFavoriteCharacterIds(List<String> ids) async {
    await api.saveFavoriteCharactersId(ids);
  }
}
