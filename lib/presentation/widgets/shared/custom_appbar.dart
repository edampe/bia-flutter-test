import 'package:bia_flutter_test/domain/entities/comic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:bia_flutter_test/presentation/delegates/search_comic_delegate.dart';
import 'package:bia_flutter_test/presentation/providers/providers.dart';
import '../../../config/fonts/bia_icons_icons.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                const Icon(BiaIcons.bia, color: Color(0xFF1de9b6), size: 50),
                const SizedBox(width: 5),
                const Icon(BiaIcons.marvelStudios,
                    color: Color(0xFFED1D24), size: 50),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      final searchedComics = ref.read(searchedComicsProvider);
                      final searchQuery = ref.read(searchQueryProvider);

                      showSearch<Comic?>(
                              query: searchQuery,
                              context: context,
                              delegate: SearchComicDelegate(
                                  initialComics: searchedComics,
                                  searchComics: ref
                                      .read(searchedComicsProvider.notifier)
                                      .searchComicsByQuery))
                          .then((comic) {
                        if (comic == null) return;

                        context.push('/comic/${comic.id}');
                      });
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
          ),
        ));
  }
}
