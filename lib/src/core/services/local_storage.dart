import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LocalStorage {
  static const String _favoriteCharactersKey = 'favorite-characters';

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveFavoriteCharactersId(List<String> ids) async {
    await _ensurePrefsInitialized();
    await _prefs!.setStringList(_favoriteCharactersKey, ids);
  }

  List<String> getFavoriteCharactersId() {
    return _prefs?.getStringList(_favoriteCharactersKey) ?? [];
  }

  Future<void> _ensurePrefsInitialized() async {
    _prefs ??= await SharedPreferences.getInstance();
  }
}
