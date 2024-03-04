import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Languages {
  es,
  en,
}

final StateProvider<Languages> languageProvider =
    StateProvider<Languages>((StateProviderRef<Languages> ref) {
  return Languages.es;
});
