import 'package:bia_flutter_test/infrastructure/datasources/marvel_api_endpoints.dart';
import 'package:bia_flutter_test/infrastructure/mappers/comic_mapper.dart';
import 'package:bia_flutter_test/infrastructure/models/marvel/comics_marvel_response.dart';

import 'package:bia_flutter_test/domain/datasources/comics_datasource.dart';
import 'package:bia_flutter_test/domain/entities/comic.dart';
import 'package:dio/dio.dart';

class ComicMarvelDatasource extends ComicsDatasource {
  final Dio basePetition = BaseApiService.basePetition();

  List<Comic> _jsonToComics(Map<String, dynamic> json) {
    final comicsMarvelResponse = ComicsMarvelResponse.fromJson(json);

    final List<Comic> comics = comicsMarvelResponse.data.results
        // .where((comic) => comic.images != 'no-poster')
        .map((comic) => ComicMapper.comicToEntity(comic))
        .toList();

    return comics;
  }

  @override
  Future<List<Comic>> getNextWeek() async {
    final response = await basePetition.get(
      '/comics',
      queryParameters: {
        'format': 'comic',
        'formatType': 'comic',
        'noVariants': true,
        'dateDescriptor': 'nextWeek',
      },
    );

    return _jsonToComics(response.data);
  }

  @override
  Future<List<Comic>> getTheTwoThousand() async {
    final response = await basePetition.get(
      '/comics',
      queryParameters: {
        'format': 'comic',
        'formatType': 'comic',
        'noVariants': true,
        'dateRange': '2000-01-01,2009-12-31',
      },
    );

    return _jsonToComics(response.data);
  }

  @override
  Future<List<Comic>> getTheNineties() async {
    final response = await basePetition.get(
      '/comics',
      queryParameters: {
        'format': 'comic',
        'formatType': 'comic',
        'noVariants': true,
        'dateRange': '1990-01-01,1999-12-31',
      },
    );

    return _jsonToComics(response.data);
  }

  @override
  Future<List<Comic>> getTheLastDecade() async {
    final response = await basePetition.get(
      '/comics',
      queryParameters: {
        'format': 'comic',
        'formatType': 'comic',
        'noVariants': true,
        'dateRange': '2010-01-01,2022-12-31',
      },
    );

    return _jsonToComics(response.data);
  }

  @override
  Future<Comic> getComicById(String id) async {
    final response = await basePetition.get('/comics/$id');
    if (response.statusCode != 200) {
      throw Exception('Comic with id: $id not found');
    }

    final data = _jsonToComics(response.data);

    return data[0];
  }

  @override
  Future<List<Comic>> searchComics(String query) async {
    final response = await basePetition.get(
      '/comics',
      queryParameters: {
        'format': 'comic',
        'formatType': 'comic',
        'noVariants': true,
        'title': query == "" ? '1' : query,
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Comic with id: $query not found');
    }

    return _jsonToComics(response.data);
  }
}
