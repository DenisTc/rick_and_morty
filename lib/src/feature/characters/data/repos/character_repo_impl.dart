import 'package:rick_and_morty/src/feature/characters/data/datasource/character_local_data_source.dart';
import 'package:rick_and_morty/src/feature/characters/data/datasource/character_remote_data_source.dart';
import 'package:rick_and_morty/src/feature/characters/data/models/character_response.dart';
import 'package:rick_and_morty/src/feature/characters/domain/repository/character_repository.dart';

class CharacterRepoImpl implements CharacterRepository {
  final CharacterRemotelDataSource _remoteDataSource;
  final CharacterLocalDataSource _localDataSource;

  CharacterRepoImpl({
    required CharacterRemotelDataSource remoteDataSource,
    required CharacterLocalDataSource localDataSource,
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
