import 'package:rick_and_morty/src/feature/characters/domain/repository/characters_repository.dart';

class SaveFavoriteCharacterIdsUseCase {
  final CharactersRepository _characterRepository;

  SaveFavoriteCharacterIdsUseCase(this._characterRepository);

  Future<void> call(List<String> ids) async =>
      _characterRepository.saveFavoriteCharacterIds(ids);
}
