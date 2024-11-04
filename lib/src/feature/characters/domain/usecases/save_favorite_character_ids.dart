import 'package:rick_and_morty/src/feature/characters/domain/repository/characters_repository.dart';

class SaveFavoriteCharacterIdsUseCase {
  final CharactersRepository _charactersRepository;

  SaveFavoriteCharacterIdsUseCase(this._charactersRepository);

  Future<void> call(List<String> ids) async =>
      _charactersRepository.saveFavoriteCharacterIds(ids);
}