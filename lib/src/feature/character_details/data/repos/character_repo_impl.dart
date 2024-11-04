import 'package:rick_and_morty/src/feature/character_details/data/datasource/characters_remote_data_source.dart';
import 'package:rick_and_morty/src/feature/character_details/domain/repository/character_repository.dart';
import 'package:rick_and_morty/src/feature/characters/data/models/character.dart';

class CharacterRepoImpl implements CharacterRepository {
  final CharacterRemotelDataSource _remoteDataSource;

  CharacterRepoImpl(this._remoteDataSource);

  @override
  Future<Character> getCharacter(int id) async {
    return await _remoteDataSource.getCharacter(id);
  }
}
