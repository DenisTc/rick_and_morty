import 'package:rick_and_morty/src/core/network/network_client.dart';
import 'package:rick_and_morty/src/feature/characters/data/models/character.dart';
import 'package:injectable/injectable.dart';

abstract interface class CharacterRemoteDataSource {
  Future<Character> getCharacter(int id);
}

@LazySingleton(as: CharacterRemoteDataSource)
class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final NetworkClient api;

  CharacterRemoteDataSourceImpl(this.api);

  @override
  Future<Character> getCharacter(int id) async {
    final response = await api.get('/character/$id');

    final result = Character.fromJson(response);
    return result;
  }
}
