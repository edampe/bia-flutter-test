import 'package:bia_flutter_test/infrastructure/models/marvel/marvel.dart';

class ComicMarvel {
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
  final List<dynamic> textObjects;
  final String resourceUri;
  final List<DateMarvel> dates;
  final List<PriceMarvel> prices;
  final ImagesMarvel thumbnail;
  final List<ImagesMarvel> images;
  final CharactersMarvel creators;
  final CharactersMarvel characters;
  final CharactersMarvel stories;
  final CharactersMarvel events;

  ComicMarvel({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    required this.variantDescription,
    this.description,
    required this.modified,
    required this.isbn,
    required this.upc,
    required this.diamondCode,
    required this.ean,
    required this.issn,
    required this.format,
    required this.pageCount,
    required this.textObjects,
    required this.resourceUri,
    required this.dates,
    required this.prices,
    required this.thumbnail,
    required this.images,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.events,
  });

  factory ComicMarvel.fromJson(Map<String, dynamic> json) => ComicMarvel(
        id: json["id"],
        digitalId: json["digitalId"],
        title: json["title"],
        issueNumber: json["issueNumber"].toDouble(),
        variantDescription: json["variantDescription"],
        description: json["description"] ?? 'Descripción no disponible',
        modified: json["modified"],
        isbn: json["isbn"],
        upc: json["upc"],
        diamondCode: json["diamondCode"],
        ean: json["ean"],
        issn: json["issn"],
        format: json["format"],
        pageCount: json["pageCount"],
        textObjects: List<dynamic>.from(json["textObjects"].map((x) => x)),
        resourceUri: json["resourceURI"],
        dates: List<DateMarvel>.from(
            json["dates"].map((x) => DateMarvel.fromJson(x))),
        prices: List<PriceMarvel>.from(
            json["prices"].map((x) => PriceMarvel.fromJson(x))),
        thumbnail: ImagesMarvel.fromJson(json["thumbnail"]),
        images: List<ImagesMarvel>.from(
            json["images"].map((x) => ImagesMarvel.fromJson(x))),
        creators: CharactersMarvel.fromJson(json["creators"]),
        characters: CharactersMarvel.fromJson(json["characters"]),
        stories: CharactersMarvel.fromJson(json["stories"]),
        events: CharactersMarvel.fromJson(json["events"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "digitalId": digitalId,
        "title": title,
        "issueNumber": issueNumber,
        "variantDescription": variantDescription,
        "description": description ?? '',
        "modified": modified,
        "isbn": isbn,
        "upc": upc,
        "diamondCode": diamondCode,
        "ean": ean,
        "issn": issn,
        "format": format,
        "pageCount": pageCount,
        "textObjects": List<dynamic>.from(textObjects.map((x) => x)),
        "resourceURI": resourceUri,
        "dates": List<DateMarvel>.from(dates.map((x) => x.toJson())),
        "prices": List<PriceMarvel>.from(prices.map((x) => x.toJson())),
        "thumbnail": thumbnail.toJson(),
        "images": List<ImagesMarvel>.from(images.map((x) => x.toJson())),
        "creators": creators.toJson(),
        "characters": characters.toJson(),
        "stories": stories.toJson(),
        "events": events.toJson(),
      };
}
