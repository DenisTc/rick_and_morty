import 'package:rick_and_morty/src/core/network/network_client.dart';
import 'package:rick_and_morty/src/feature/characters/data/models/character_response.dart';
import 'package:injectable/injectable.dart';

abstract interface class CharactersRemoteDataSource {
  Future<CharacterResponse> getCharacters(int page);
}

@LazySingleton(as: CharactersRemoteDataSource)
class CharactersRemoteDataSourceImpl implements CharactersRemoteDataSource {
  final NetworkClient api;

  CharactersRemoteDataSourceImpl(this.api);

  @override
  Future<CharacterResponse> getCharacters(int page) async {
    final response = await api.get('/character?page=$page');

    final result = CharacterResponse.fromJson(response);
    return result;
  }
}
