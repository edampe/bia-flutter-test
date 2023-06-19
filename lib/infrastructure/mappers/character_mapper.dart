import 'package:bia_flutter_test/domain/entities/character.dart';

class CharacterMapper {
  static Characters castToEntity(Characters cast) => Characters(
        available: cast.available,
        collectionUri: cast.collectionUri,
        items: cast.items,
        returned: cast.returned,
      );
}
