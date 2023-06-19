import 'package:bia_flutter_test/infrastructure/datasources/comic_marvel_datasource.dart';
import 'package:bia_flutter_test/infrastructure/repositories/comic_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este repositorio es inmutable
final comicRepositoryProvider = Provider((ref) {
  return ComicRepositoryImpl(ComicMarvelDatasource());
});
