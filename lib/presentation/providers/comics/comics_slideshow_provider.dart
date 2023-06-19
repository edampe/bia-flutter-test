import 'package:bia_flutter_test/domain/entities/comic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'comics_providers.dart';

final comicsSlideshowProvider = Provider<List<Comic>>((ref) {
  final nextWeekComicsComics = ref.watch(nextWeekComicsProvider);

  if (nextWeekComicsComics.isEmpty) return [];

  return nextWeekComicsComics.sublist(0, 6);
});
