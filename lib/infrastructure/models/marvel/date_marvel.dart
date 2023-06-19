import 'package:bia_flutter_test/domain/entities/comic.dart';

class DateMarvel {
  final String type;
  final String date;

  DateMarvel({
    required this.type,
    required this.date,
  });

  factory DateMarvel.fromJson(Map<String, dynamic> json) => DateMarvel(
        type: json["type"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "date": date,
      };

  Date toDate() => Date(type: type, date: date);
}
