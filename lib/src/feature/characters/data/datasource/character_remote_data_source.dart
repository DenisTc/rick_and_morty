import 'package:rick_and_morty/src/core/network/network_client.dart';
import 'package:rick_and_morty/src/feature/characters/data/models/character_response.dart';

abstract interface class CharacterRemotelDataSource {
  Future<CharacterResponse> getCharacters(int page);
}

class CharacterRemotelDataSourceImpl implements CharacterRemotelDataSource {
  final NetworkClient api;

  CharacterRemotelDataSourceImpl(this.api);

  @override
  Future<CharacterResponse> getCharacters(int page) async {
    final response = await api.get('/character?page=$page');

    final result = CharacterResponse.fromJson(response);
    return result;
  }
}
