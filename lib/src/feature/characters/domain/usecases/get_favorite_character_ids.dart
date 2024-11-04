import 'package:rick_and_morty/src/feature/characters/domain/repository/character_repository.dart';

class GetFavoriteCharacterIdsUseCase {
  final CharacterRepository _characterRepository;

  GetFavoriteCharacterIdsUseCase(this._characterRepository);

  Future<List<String>> call() async =>
      _characterRepository.getFavoriteCharacterIds();
}
