import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/src/core/network/dio_network_client.dart';
import 'package:rick_and_morty/src/core/network/network_client.dart';
import 'package:rick_and_morty/src/core/services/local_storage.dart';
import 'package:rick_and_morty/src/feature/characters/data/datasource/character_local_data_source.dart';
import 'package:rick_and_morty/src/feature/characters/data/datasource/character_remote_data_source.dart';
import 'package:rick_and_morty/src/feature/characters/data/repos/character_repo_impl.dart';
import 'package:rick_and_morty/src/feature/characters/domain/repository/character_repository.dart';
import 'package:rick_and_morty/src/feature/characters/domain/usecases/get_characters.dart';
import 'package:rick_and_morty/src/feature/characters/domain/usecases/get_favorite_character_ids.dart';
import 'package:rick_and_morty/src/feature/characters/domain/usecases/save_favorite_character_ids.dart';
import 'package:rick_and_morty/src/feature/characters/store/characters_store.dart';

final sl = GetIt.instance;

Future<void> initSl() async {
  _initLocalStorage();
  _initCharacter();
}

Future<void> _initLocalStorage() async {
  sl.registerLazySingleton(() => LocalStorage());
}

Future<void> _initCharacter() async {
  sl
    ..registerFactory(
      () => CharactersStore(
        getCharactes: sl(),
        getFavoriteCharacterIds: sl(),
        saveFavoriteCharacterIds: sl(),
      ),
    )
    ..registerLazySingleton(() => GetCharactesUseCase(sl()))
    ..registerLazySingleton(() => GetFavoriteCharacterIdsUseCase(sl()))
    ..registerLazySingleton(() => SaveFavoriteCharacterIdsUseCase(sl()))
    ..registerLazySingleton<NetworkClient>(
      () => DioNetworkClient(),
    )
    ..registerLazySingleton<CharacterLocalDataSource>(
      () => CharacterLocalDataSourceImpl(sl()),
    )
    ..registerLazySingleton<CharacterRemotelDataSource>(
      () => CharacterRemotelDataSourceImpl(sl()),
    )
    ..registerLazySingleton<CharacterRepository>(
      () => CharacterRepoImpl(
        localDataSource: sl(),
        remoteDataSource: sl(),
      ),
    );
}
