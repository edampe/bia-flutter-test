import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bia_flutter_test/presentation/providers/providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final step1 = ref.watch(comicsSlideshowProvider).isEmpty;
  final step2 = ref.watch(theTwoThousandComicsProvider).isEmpty;
  final step3 = ref.watch(theNinetiesComicsProvider).isEmpty;
  final step4 = ref.watch(theLastDecadeComicsProvider).isEmpty;

  if (step1 || step2 || step3 || step4) return true;

  return false; // terminamos de cargar
});
