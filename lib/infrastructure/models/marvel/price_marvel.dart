import 'package:bia_flutter_test/domain/entities/comic.dart';

class PriceMarvel {
  final String type;
  final double price;

  PriceMarvel({
    required this.type,
    required this.price,
  });

  factory PriceMarvel.fromJson(Map<String, dynamic> json) => PriceMarvel(
        type: json["type"],
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "price": price,
      };

  Price toPrice() => Price(type: type, price: price);
}
