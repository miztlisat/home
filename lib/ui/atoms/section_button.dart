// ignore_for_file: non_constant_identifier_names

import 'package:miztli/ui/providers/language_provider.dart';
import 'package:miztli/ui/providers/scroll_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SectionButton extends ConsumerStatefulWidget {
  const SectionButton({
    super.key,
    required this.label_en,
    required this.label_es,
    this.index = 0,
  });

  final String label_en;
  final String label_es;
  final int index;

  @override
  ConsumerState<SectionButton> createState() => _SectionButtonState();
}

class _SectionButtonState extends ConsumerState<SectionButton> {
  double hoverValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final scrollController = ref.watch(scrollControllerProvider);
    final language = ref.watch(languageProvider);

    return MouseRegion(
      child: GestureDetector(
        onTap: () {
          if (Scaffold.of(context).isEndDrawerOpen) {
            Navigator.pop(context);
          }
          scrollController.scrollTo(
            index: widget.index,
            duration: const Duration(milliseconds: 500),
          );
        },
        child: Container(
          width: hoverValue > 0.5 ? 50 : 0, // Valor intermedio
          color: Theme.of(context).colorScheme.onSecondary,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: Text(
              language == Languages.en ? widget.label_en : widget.label_es,
              key: UniqueKey(),
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ),
      ),
      onEnter: (e) {
        setState(() {
          hoverValue = 1.0;
        });
      },
      onExit: (e) {
        setState(() {
          hoverValue = 0.0;
        });
      },
    );
  }
}
