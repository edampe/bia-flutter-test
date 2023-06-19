import 'package:bia_flutter_test/domain/entities/comic.dart';
import 'package:bia_flutter_test/infrastructure/models/marvel/marvel.dart';

class ComicMapper {
  static Comic comicToEntity(ComicMarvel comic) => Comic(
        id: comic.id,
        digitalId: comic.digitalId,
        title: comic.title,
        issueNumber: comic.issueNumber,
        variantDescription: comic.variantDescription,
        description: comic.description,
        modified: comic.modified,
        isbn: comic.isbn,
        upc: comic.upc,
        diamondCode: comic.diamondCode,
        ean: comic.ean,
        issn: comic.issn,
        format: comic.format,
        pageCount: comic.pageCount,
        resourceUri: comic.resourceUri,
        images: List<Images>.from(comic.images.map((x) => x.toImages())),
        prices: List<Price>.from(comic.prices.map((x) => x.toPrice())),
        dates: List<Date>.from(comic.dates.map((x) => x.toDate())),
        thumbnail: comic.thumbnail.toImages(),
        creators: comic.creators.toCharacters(),
        characters: comic.characters.toCharacters(),
      );
}
