import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/core/enums/gender_enum.dart';
import 'package:rick_and_morty/src/core/enums/species_enum.dart';
import 'package:rick_and_morty/src/core/enums/status_enum.dart';
import 'package:rick_and_morty/src/core/icons/gen/assets.gen.dart';
import 'package:rick_and_morty/src/core/localization/generated/l10n.dart';

enum CharCharacteristicEnum { gender, species, status, name }

extension CharCharacteristicX on CharCharacteristicEnum {
  String title(BuildContext context) {
    return switch (this) {
      CharCharacteristicEnum.name => S.of(context).name,
      CharCharacteristicEnum.status => S.of(context).status,
      CharCharacteristicEnum.species => S.of(context).species,
      CharCharacteristicEnum.gender => S.of(context).gender,
    };
  }

  AssetGenImage icon(String value) {
    final key = value.toLowerCase();
    return switch (this) {
      CharCharacteristicEnum.status => switch (key) {
          _ when key == StatusEnum.alive.name => Assets.icons.characterStatus.alive,
          _ when key == StatusEnum.dead.name => Assets.icons.characterStatus.dead,
          _ => Assets.icons.characterStatus.unknown,
        },
      CharCharacteristicEnum.species => switch (key) {
          _ when key == SpeciesEnum.alien.name => Assets.icons.characterSpecies.alien,
          _ when key == SpeciesEnum.human.name => Assets.icons.characterSpecies.human,
          _ => Assets.icons.info,
        },
      CharCharacteristicEnum.gender || CharCharacteristicEnum.name => switch (key) {
          _ when key == GenderEnum.male.name => Assets.icons.characterGender.male,
          _ when key == GenderEnum.female.name => Assets.icons.characterGender.female,
          _ when key == GenderEnum.unknown.name => Assets.icons.characterGender.unknown,
          _ => Assets.icons.info,
        },
    };
  }
}
