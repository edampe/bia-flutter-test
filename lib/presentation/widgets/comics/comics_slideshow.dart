import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:bia_flutter_test/domain/entities/comic.dart';

class ComicsSlideshow extends StatelessWidget {
  final List<Comic> comics;

  const ComicsSlideshow({super.key, required this.comics});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 320,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.5,
        scale: 0.5,
        autoplay: true,
        pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
                activeColor: colors.primary, color: colors.secondary)),
        itemCount: comics.length,
        itemBuilder: (context, index) => _Slide(comic: comics[index]),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Comic comic;

  const _Slide({required this.comic});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
        ]);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                ('${comic.thumbnail.path}.${comic.thumbnail.extension}'),
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black12));
                  }
                  return FadeIn(child: child);
                },
              ))),
    );
  }
}
