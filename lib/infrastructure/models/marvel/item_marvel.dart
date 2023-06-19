import 'package:bia_flutter_test/domain/entities/character.dart';

class ItemMarvel {
  final String resourceUri;
  final String name;
  final String? role;
  final String? type;

  ItemMarvel({
    required this.resourceUri,
    required this.name,
    this.role,
    this.type,
  });

  factory ItemMarvel.fromJson(Map<String, dynamic> json) => ItemMarvel(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "role": role,
        "type": type,
      };

  Item toItem() => Item(resourceUri: resourceUri, name: name);
}
