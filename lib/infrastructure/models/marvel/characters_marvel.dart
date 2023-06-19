import 'package:bia_flutter_test/domain/entities/character.dart';
import 'package:bia_flutter_test/infrastructure/models/marvel/item_marvel.dart';

class CharactersMarvel {
  final int available;
  final String collectionUri;
  final List<ItemMarvel> items;
  final int returned;

  CharactersMarvel({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory CharactersMarvel.fromJson(Map<String, dynamic> json) =>
      CharactersMarvel(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<ItemMarvel>.from(
            json["items"].map((x) => ItemMarvel.fromJson(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
      };

  Characters toCharacters() => Characters(
      available: available,
      collectionUri: collectionUri,
      items: List<Item>.from(items.map((x) => x.toItem())),
      returned: returned);
}
