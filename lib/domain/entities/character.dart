class Characters {
  final int available;
  final String collectionUri;
  final List<Item> items;
  final int returned;

  Characters({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });
}

class Item {
  final String resourceUri;
  final String name;
  final String? role;
  final String? type;

  Item({
    required this.resourceUri,
    required this.name,
    this.role,
    this.type,
  });
}
