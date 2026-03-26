import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty/src/core/network/app_exception.dart';
import 'package:rick_and_morty/src/feature/character_details/domain/usecases/get_character.dart';
import 'package:rick_and_morty/src/feature/characters/data/models/character.dart';

part 'character_store.g.dart';

@injectable
class CharacterStore = CharacterBase with _$CharacterStore;

abstract class CharacterBase with Store {
  final GetCharacterUseCase _getCharacter;

  CharacterBase(this._getCharacter);

  @observable
  Character? character;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchCharacter(int id) async {
    isLoading = true;
    errorMessage = null;

    try {
      character = await _getCharacter.call(id);
    } on AppException catch (e) {
      errorMessage = e.message;
    } catch (_) {
      errorMessage = 'Something went wrong';
    } finally {
      isLoading = false;
    }
  }
}
