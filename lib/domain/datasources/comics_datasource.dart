import 'package:bia_flutter_test/domain/entities/comic.dart';

abstract class ComicsDatasource {
  Future<List<Comic>> getNextWeek();

  Future<List<Comic>> getTheTwoThousand();

  Future<List<Comic>> getTheNineties();

  Future<List<Comic>> getTheLastDecade();

  Future<Comic> getComicById(String id);

  Future<List<Comic>> searchComics(String query);
}
