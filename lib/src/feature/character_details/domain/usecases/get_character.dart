import 'package:rick_and_morty/src/feature/character_details/domain/repository/character_repository.dart';
import 'package:rick_and_morty/src/feature/characters/data/models/character.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCharacterUseCase {
  final CharacterRepository _characterRepository;

  GetCharacterUseCase(this._characterRepository);

  Future<Character> call(int id) async => _characterRepository.getCharacter(id);
}
