import 'package:rick_and_morty/src/feature/characters/data/models/character.dart';
import 'package:rick_and_morty/src/feature/characters/data/models/info.dart';

class CharacterResponse {
  final Info info;
  final List<Character> results;

  CharacterResponse({required this.info, required this.results});

  factory CharacterResponse.fromJson(Map<String, dynamic> json) {
    return CharacterResponse(
      info: Info.fromJson(json['info']),
      results: (json['results'] as List)
          .map((character) => Character.fromJson(character))
          .toList(),
    );
  }
}
