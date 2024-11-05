import 'package:rick_and_morty/src/feature/characters/data/models/character_response.dart';
import 'package:rick_and_morty/src/feature/characters/domain/repository/characters_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCharactersUseCase {
  final CharactersRepository _charactersRepository;

  GetCharactersUseCase(this._charactersRepository);

  Future<CharacterResponse> call(int page) async =>
      _charactersRepository.getCharacters(page);
}
