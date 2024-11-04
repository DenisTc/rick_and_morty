import 'package:rick_and_morty/src/feature/characters/data/models/character.dart';

abstract interface class CharacterRepository {
  Future<Character> getCharacter(int id);
}
