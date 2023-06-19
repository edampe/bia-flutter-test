import 'package:bia_flutter_test/domain/datasources/comics_datasource.dart';
import 'package:bia_flutter_test/domain/entities/comic.dart';
import 'package:bia_flutter_test/domain/repositories/comics_reposirory.dart';

class ComicRepositoryImpl extends ComicsRepository {
  final ComicsDatasource datasource;
  ComicRepositoryImpl(this.datasource);

  @override
  Future<List<Comic>> getNextWeek() {
    return datasource.getNextWeek();
  }

  @override
  Future<List<Comic>> getTheTwoThousand() {
    return datasource.getTheTwoThousand();
  }

  @override
  Future<List<Comic>> getTheNineties() {
    return datasource.getTheNineties();
  }

  @override
  Future<List<Comic>> getTheLastDecade() {
    return datasource.getTheLastDecade();
  }

  @override
  Future<Comic> getComicById(String id) {
    return datasource.getComicById(id);
  }

  @override
  Future<List<Comic>> searchComics(String query) {
    return datasource.searchComics(query);
  }
}
