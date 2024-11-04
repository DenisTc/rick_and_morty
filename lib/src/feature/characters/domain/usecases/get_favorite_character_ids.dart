import 'package:rick_and_morty/src/feature/characters/domain/repository/characters_repository.dart';

class GetFavoriteCharacterIdsUseCase {
  final CharactersRepository _characterRepository;

  GetFavoriteCharacterIdsUseCase(this._characterRepository);

  Future<List<String>> call() async =>
      _characterRepository.getFavoriteCharacterIds();
}
