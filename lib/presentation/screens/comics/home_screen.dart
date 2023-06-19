import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bia_flutter_test/presentation/providers/providers.dart';
import 'package:bia_flutter_test/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nextWeekComicsProvider.notifier).loadNextPage();
    ref.read(theTwoThousandComicsProvider.notifier).loadNextPage();
    ref.read(theNinetiesComicsProvider.notifier).loadNextPage();
    ref.read(theLastDecadeComicsProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final nextWeekComics = ref.watch(comicsSlideshowProvider);
    final theTwoThousandComics = ref.watch(theTwoThousandComicsProvider);
    final theNinetiesComics = ref.watch(theNinetiesComicsProvider);
    final theLastDecadeComics = ref.watch(theLastDecadeComicsProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            // const CustomAppbar(),

            ComicsSlideshow(comics: nextWeekComics),

            ComicHorizontalListview(
              comics: theLastDecadeComics,
              title: 'La ultima decada',
              subTitle: '2010 - 2022',
            ),

            ComicHorizontalListview(
              comics: theTwoThousandComics,
              title: 'Nuevo milenio',
              subTitle: '2000 - 2009',
            ),

            ComicHorizontalListview(
              comics: theNinetiesComics,
              title: 'Los noventas',
              subTitle: '90s',
            ),

            const SizedBox(height: 10),
          ],
        );
      }, childCount: 1)),
    ]);
  }
}
