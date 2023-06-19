import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bia_flutter_test/domain/entities/comic.dart';
import 'package:bia_flutter_test/presentation/providers/comics/comics_repository_provider.dart';

final nextWeekComicsProvider =
    StateNotifierProvider<ComicsNotifier, List<Comic>>((ref) {
  final fetchMoreComics = ref.watch(comicRepositoryProvider).getNextWeek;
  return ComicsNotifier(fetchMoreComics: fetchMoreComics);
});

final theTwoThousandComicsProvider =
    StateNotifierProvider<ComicsNotifier, List<Comic>>((ref) {
  final fetchMoreComics = ref.watch(comicRepositoryProvider).getTheTwoThousand;
  return ComicsNotifier(fetchMoreComics: fetchMoreComics);
});

final theNinetiesComicsProvider =
    StateNotifierProvider<ComicsNotifier, List<Comic>>((ref) {
  final fetchMoreComics = ref.watch(comicRepositoryProvider).getTheNineties;
  return ComicsNotifier(fetchMoreComics: fetchMoreComics);
});

final theLastDecadeComicsProvider =
    StateNotifierProvider<ComicsNotifier, List<Comic>>((ref) {
  final fetchMoreComics = ref.watch(comicRepositoryProvider).getTheLastDecade;
  return ComicsNotifier(fetchMoreComics: fetchMoreComics);
});

typedef ComicCallback = Future<List<Comic>> Function();

class ComicsNotifier extends StateNotifier<List<Comic>> {
  bool isLoading = false;
  ComicCallback fetchMoreComics;

  ComicsNotifier({
    required this.fetchMoreComics,
  }) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    final List<Comic> comic = await fetchMoreComics();
    state = [...state, ...comic];

    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
