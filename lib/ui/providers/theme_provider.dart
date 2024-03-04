import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<bool> isDarkModeProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return true;
});
