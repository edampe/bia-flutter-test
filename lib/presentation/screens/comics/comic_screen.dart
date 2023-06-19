import 'package:bia_flutter_test/domain/entities/comic.dart';
import 'package:bia_flutter_test/presentation/providers/comics/comic_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';

class ComicScreen extends ConsumerStatefulWidget {
  static const name = 'comic-screen';

  final String comicId;

  const ComicScreen({
    super.key,
    required this.comicId,
  });

  @override
  ComicScreenState createState() => ComicScreenState();
}

class ComicScreenState extends ConsumerState<ComicScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(comicInfoProvider.notifier).loadComic(widget.comicId);
  }

  @override
  Widget build(BuildContext context) {
    final Comic? comic = ref.watch(comicInfoProvider)[widget.comicId];

    if (comic == null) {
      return const Scaffold(
          body: Center(child: CircularProgressIndicator(strokeWidth: 2)));
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(comic: comic),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => _ComicDetails(comic: comic),
                  childCount: 1))
        ],
      ),
    );
  }
}

class _ComicDetails extends StatelessWidget {
  final Comic comic;

  const _ComicDetails({required this.comic});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  ('${comic.thumbnail.path}.${comic.thumbnail.extension}'),
                  width: size.width * 0.25,
                ),
              ),

              const SizedBox(width: 10),

              // Descripción
              SizedBox(
                width: (size.width - 40) * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(comic.title, style: textStyles.titleLarge),
                    Text(comic.description),
                  ],
                ),
              )
            ],
          ),
        ),

        //Creators

        Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Creadores', style: textStyles.titleLarge),
                ),
              ),
              const SizedBox(height: 50),
              ...comic.creators.items.map((creator) => Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Chip(
                      label: Text(
                        creator.name,
                        style:
                            textStyles.bodyLarge?.copyWith(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ))
            ],
          ),
        ),

        const SizedBox(height: 50),
      ],
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Comic comic;

  const _CustomSliverAppBar({required this.comic});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                ('${comic.thumbnail.path}.${comic.thumbnail.extension}'),
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) return const SizedBox();
                  return FadeIn(child: child);
                },
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.7, 1.0],
                          colors: [Colors.transparent, Colors.black87]))),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment.topLeft, stops: [
                0.0,
                0.3
              ], colors: [
                Colors.black87,
                Colors.transparent,
              ]))),
            ),
          ],
        ),
      ),
    );
  }
}
