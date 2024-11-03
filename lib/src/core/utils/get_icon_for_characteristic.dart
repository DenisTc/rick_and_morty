import 'package:rick_and_morty/src/core/enums/character_characteristic_enum.dart';
import 'package:rick_and_morty/src/core/enums/gender_enum.dart';
import 'package:rick_and_morty/src/core/enums/species_enum.dart';
import 'package:rick_and_morty/src/core/enums/status_enum.dart';
import 'package:rick_and_morty/src/core/icons/gen/assets.gen.dart';

AssetGenImage getIconForCharacteristic({
  required CharCharacteristicEnum typeEnum,
  required String value,
}) {
  final iconName = value.toLowerCase();
  if (typeEnum == CharCharacteristicEnum.status) {
    if (StatusEnum.alive.name == iconName) {
      return Assets.icons.characterStatus.alive;
    } else if (StatusEnum.dead.name == iconName) {
      return Assets.icons.characterStatus.dead;
    } else if (StatusEnum.unknown.name == iconName) {
      return Assets.icons.characterStatus.unknown;
    }
  } else if (typeEnum == CharCharacteristicEnum.species) {
    if (SpeciesEnum.alien.name == iconName) {
      return Assets.icons.characterSpecies.alien;
    } else if (SpeciesEnum.human.name == iconName) {
      return Assets.icons.characterSpecies.human;
    }
  } else if (typeEnum == CharCharacteristicEnum.gender) {
    if (GenderEnum.male.name == iconName) {
      return Assets.icons.characterGender.male;
    } else if (GenderEnum.female.name == iconName) {
      return Assets.icons.characterGender.female;
    } else if (GenderEnum.unknown.name == iconName) {
      return Assets.icons.characterStatus.unknown;
    }
  }

  return Assets.icons.info;
}
