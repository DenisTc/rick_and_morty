import 'package:rick_and_morty/src/feature/characters/domain/repository/characters_repository.dart';

class GetFavoriteCharacterIdsUseCase {
  final CharactersRepository _charactersRepository;

  GetFavoriteCharacterIdsUseCase(this._charactersRepository);

  Future<List<String>> call() async =>
      _charactersRepository.getFavoriteCharacterIds();
}
