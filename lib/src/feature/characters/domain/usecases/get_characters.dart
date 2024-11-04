import 'package:rick_and_morty/src/feature/characters/data/models/character_response.dart';
import 'package:rick_and_morty/src/feature/characters/domain/repository/characters_repository.dart';

class GetCharactesUseCase {
  final CharactersRepository _characterRepository;

  GetCharactesUseCase(this._characterRepository);

  Future<CharacterResponse> call(int page) async =>
      _characterRepository.getCharacters(page);
}
