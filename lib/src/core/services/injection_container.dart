import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/src/core/network/dio_network_client.dart';
import 'package:rick_and_morty/src/core/network/network_client.dart';
import 'package:rick_and_morty/src/core/services/local_storage.dart';
import 'package:rick_and_morty/src/feature/character_details/data/datasource/characters_remote_data_source.dart';
import 'package:rick_and_morty/src/feature/character_details/data/repos/character_repo_impl.dart';
import 'package:rick_and_morty/src/feature/character_details/domain/repository/character_repository.dart';
import 'package:rick_and_morty/src/feature/character_details/domain/usecases/get_character.dart';
import 'package:rick_and_morty/src/feature/character_details/store/character_store.dart';
import 'package:rick_and_morty/src/feature/characters/data/datasource/characters_local_data_source.dart';
import 'package:rick_and_morty/src/feature/characters/data/datasource/characters_remote_data_source.dart';
import 'package:rick_and_morty/src/feature/characters/data/repos/characters_repo_impl.dart';
import 'package:rick_and_morty/src/feature/characters/domain/repository/characters_repository.dart';
import 'package:rick_and_morty/src/feature/characters/domain/usecases/get_characters.dart';
import 'package:rick_and_morty/src/feature/characters/domain/usecases/get_favorite_character_ids.dart';
import 'package:rick_and_morty/src/feature/characters/domain/usecases/save_favorite_character_ids.dart';
import 'package:rick_and_morty/src/feature/characters/store/characters_store.dart';

final sl = GetIt.instance;

Future<void> initSl() async {
  _initLocalStorage();
  _initNetworkClient();
  _initCharacters();
  _initCharacter();
}

Future<void> _initLocalStorage() async {
  sl.registerLazySingleton(() => LocalStorage());
}

Future<void> _initNetworkClient() async {
  sl.registerLazySingleton<NetworkClient>(
    () => DioNetworkClient(),
  );
}

Future<void> _initCharacters() async {
  sl
    ..registerFactory(
      () => CharactersStore(
        getCharactes: sl(),
        getFavoriteCharacterIds: sl(),
        saveFavoriteCharacterIds: sl(),
      ),
    )
    ..registerLazySingleton(() => GetCharactersUseCase(sl()))
    ..registerLazySingleton(() => GetFavoriteCharacterIdsUseCase(sl()))
    ..registerLazySingleton(() => SaveFavoriteCharacterIdsUseCase(sl()))
    ..registerLazySingleton<CharactersLocalDataSource>(
      () => CharactersLocalDataSourceImpl(sl()),
    )
    ..registerLazySingleton<CharactersRemotelDataSource>(
      () => CharactersRemotelDataSourceImpl(sl()),
    )
    ..registerLazySingleton<CharactersRepository>(
      () => CharactersRepoImpl(
        localDataSource: sl(),
        remoteDataSource: sl(),
      ),
    );
}

Future<void> _initCharacter() async {
  sl
    ..registerFactory(
      () => CharacterStore(sl()),
    )
    ..registerLazySingleton(() => GetCharacterUseCase(sl()))
    ..registerLazySingleton<CharacterRemotelDataSource>(
      () => CharacterRemotelDataSourceImpl(sl()),
    )
    ..registerLazySingleton<CharacterRepository>(
      () => CharacterRepoImpl(sl()),
    );
}
