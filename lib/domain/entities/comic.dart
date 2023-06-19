import 'package:bia_flutter_test/domain/entities/character.dart';

class Comic {
  final int id;
  final int digitalId;
  final String title;
  final double issueNumber;
  final String variantDescription;
  final dynamic description;
  final String modified;
  final String isbn;
  final String upc;
  final String diamondCode;
  final String ean;
  final String issn;
  final String format;
  final int pageCount;
  final String resourceUri;
  final List<Date> dates;
  final List<Price>? prices;
  final Images thumbnail;
  final List<Images> images;
  final Characters creators;
  final Characters characters;

  Comic({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    required this.variantDescription,
    required this.description,
    required this.modified,
    required this.isbn,
    required this.upc,
    required this.diamondCode,
    required this.ean,
    required this.issn,
    required this.format,
    required this.pageCount,
    required this.resourceUri,
    required this.dates,
    required this.prices,
    required this.thumbnail,
    required this.images,
    required this.creators,
    required this.characters,
  });
}

class Images {
  final String path;
  final String extension;

  Images({
    required this.path,
    required this.extension,
  });
}

class Date {
  final String type;
  final String date;

  Date({
    required this.type,
    required this.date,
  });
}

class Price {
  final String type;
  final double price;

  Price({
    required this.type,
    required this.price,
  });
}
