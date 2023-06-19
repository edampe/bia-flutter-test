import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';

import 'package:bia_flutter_test/domain/entities/comic.dart';

class ComicHorizontalListview extends StatefulWidget {
  final List<Comic> comics;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const ComicHorizontalListview({
    super.key,
    required this.comics,
    this.title,
    this.subTitle,
    this.loadNextPage,
  });

  @override
  State<ComicHorizontalListview> createState() =>
      _ComicHorizontalListviewState();
}

class _ComicHorizontalListviewState extends State<ComicHorizontalListview> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _Title(title: widget.title, subTitle: widget.subTitle),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            controller: scrollController,
            itemCount: widget.comics.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return FadeInRight(child: _Slide(comic: widget.comics[index]));
            },
          ))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Comic comic;

  const _Slide({required this.comic});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Imagen
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                ('${comic.thumbnail.path}.${comic.thumbnail.extension}'),
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2)),
                    );
                  }
                  return GestureDetector(
                    onTap: () => context.push('/comic/${comic.id}'),
                    child: FadeIn(child: child),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 5),

          //* Title
          SizedBox(
            width: 150,
            child: Text(
              comic.title,
              maxLines: 1,
              style: textStyles.titleSmall,
            ),
          ),

          //* Price
          SizedBox(
            width: 150,
            child: Row(
              children: [
                const Spacer(),

                Icon(Icons.attach_money, color: Colors.green.shade900),
                Text('${comic.prices![0].price}',
                    style: textStyles.bodyLarge
                        ?.copyWith(color: Colors.green.shade900)),
                // Text(HumanFormats.date(comic.dates[0].date),
                //     style: textStyles.bodySmall),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
          const Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
                style: const ButtonStyle(visualDensity: VisualDensity.compact),
                onPressed: () {},
                child: Text(subTitle!))
        ],
      ),
    );
  }
}
