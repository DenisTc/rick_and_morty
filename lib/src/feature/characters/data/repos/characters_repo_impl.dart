import 'package:rick_and_morty/src/feature/characters/data/datasource/characters_local_data_source.dart';
import 'package:rick_and_morty/src/feature/characters/data/datasource/characters_remote_data_source.dart';
import 'package:rick_and_morty/src/feature/characters/data/models/character_response.dart';
import 'package:rick_and_morty/src/feature/characters/domain/repository/characters_repository.dart';

class CharactersRepoImpl implements CharactersRepository {
  final CharactersRemotelDataSource _remoteDataSource;
  final CharactersLocalDataSource _localDataSource;

  CharactersRepoImpl({
    required CharactersRemotelDataSource remoteDataSource,
    required CharactersLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future<CharacterResponse> getCharacters(int page) async {
    return await _remoteDataSource.getCharacters(page);
  }

  @override
  Future<List<String>> getFavoriteCharacterIds() async {
    return await _localDataSource.getFavoriteCharacterIds();
  }

  @override
  Future<void> saveFavoriteCharacterIds(List<String> ids) async {
    await _localDataSource.saveFavoriteCharacterIds(ids);
  }
}
