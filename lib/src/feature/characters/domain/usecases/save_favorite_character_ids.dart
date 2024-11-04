import 'package:rick_and_morty/src/feature/characters/domain/repository/character_repository.dart';

class SaveFavoriteCharacterIdsUseCase {
  final CharacterRepository _characterRepository;

  SaveFavoriteCharacterIdsUseCase(this._characterRepository);

  Future<void> call(List<String> ids) async =>
      _characterRepository.saveFavoriteCharacterIds(ids);
}
