import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final _favoriteCharactersKey = 'favorite-characters';

  static final LocalStorage _singleton = LocalStorage._();

  factory LocalStorage() {
    return _singleton;
  }

  LocalStorage._();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> toggleCharacterToFavorite(String id) async {
    await _ensurePrefsInitialized();

    final favoriteCharacters = getFavoriteCharactersId();
    if (!favoriteCharacters.contains(id)) {
      favoriteCharacters.add(id);
    } else {
      favoriteCharacters.remove(id);
    }
    await _prefs!.setStringList(_favoriteCharactersKey, favoriteCharacters);
  }

  Future<void> saveFavoriteCharactersId(List<String> ids) async {
    await _ensurePrefsInitialized();
    await _prefs!.setStringList(_favoriteCharactersKey, ids);
  }

  bool isFavoriteCharacter(String id) {
    final favoriteCharacters = getFavoriteCharactersId();
    return favoriteCharacters.contains(id);
  }

  List<String> getFavoriteCharactersId() {
    return _prefs?.getStringList(_favoriteCharactersKey) ?? [];
  }

  Future<void> _ensurePrefsInitialized() async {
    _prefs ??= await SharedPreferences.getInstance();
  }
}
