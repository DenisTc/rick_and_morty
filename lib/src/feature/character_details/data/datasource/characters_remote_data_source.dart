import 'package:rick_and_morty/src/core/network/network_client.dart';
import 'package:rick_and_morty/src/feature/characters/data/models/character.dart';
import 'package:rick_and_morty/src/feature/characters/data/models/character_response.dart';

abstract interface class CharacterRemotelDataSource {
  Future<Character> getCharacter(int id);
}

class CharacterRemotelDataSourceImpl implements CharacterRemotelDataSource {
  final NetworkClient api;

  CharacterRemotelDataSourceImpl(this.api);

  @override
  Future<Character> getCharacter(int id) async {
    final response = await api.get('/character/$id');

    final result = Character.fromJson(response);
    return result;
  }
}