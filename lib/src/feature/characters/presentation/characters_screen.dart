import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rick_and_morty/src/core/localization/generated/l10n.dart';
import 'package:rick_and_morty/src/core/widgets/error_placeholder.dart';
import 'package:rick_and_morty/src/feature/characters/presentation/widgets/character_card.dart';
import 'package:rick_and_morty/src/feature/characters/store/characters_store.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({
    super.key,
  });

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late final CharactersStore store;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    store = context.read<CharactersStore>();
    store.fetchCharacters();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onLoading() async {
    store.fetchCharacters(isNextPage: true);
    await Future.delayed(const Duration(milliseconds: 1000));

    if (store.hasNextPage) {
      _refreshController.loadComplete();
    } else {
      _refreshController.loadNoData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Observer(
          builder: (_) {
            if (store.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!store.hasNextPage) {
              _refreshController.loadNoData();
            }

            if (store.errorMessage != null) {
              return ErrorPlaceHolder(
                errorMessage: store.errorMessage ?? S.of(context).errorMessage,
                onTap: () => store.fetchCharacters(),
              );
            }

            return SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              controller: _refreshController,
              onLoading: _onLoading,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .74,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 20.0,
                ),
                padding: const EdgeInsets.all(20.0),
                itemCount: store.characters.length,
                itemBuilder: (context, index) {
                  return CharacterCard(character: store.characters[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
