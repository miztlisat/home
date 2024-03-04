import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miztli/ui/views/about_us.dart';
import 'package:miztli/ui/views/next_event.dart';
import 'package:miztli/ui/views/splash.dart';
import 'package:miztli/ui/molecules/custom_appbar.dart';
import 'package:miztli/ui/providers/scroll_controller.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final elements = [
    const NextEventMiztli(),
    const AboutUs(),
    ...List.generate(
      3,
      (index) => SizedBox(
        height: 1000,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(116, 244, 67, 54), // color del borde
              width: 2.0, // ancho del borde
            ),
          ),
          height: 1000,
        ),
      ),
    ),
  ];

  final ItemScrollController _controller = ItemScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1800)).then((_) {
      _controller.scrollTo(
          index: 1, duration: const Duration(milliseconds: 800));
    });
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ref.watch(scrollControllerProvider);
    return Scaffold(
      body: ScrollablePositionedList.builder(
        itemScrollController: _controller,
        shrinkWrap: true,
        itemCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final childrens = [
            const Splash(),
            Column(
              children: [
                const CustomAppBar(),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                  child: ScrollablePositionedList.builder(
                    itemScrollController: scrollController,
                    shrinkWrap: true,
                    itemCount: elements.length,
                    itemBuilder: (BuildContext context, int index) {
                      return elements[index];
                    },
                  ),
                ),
              ],
            ),
          ];
          return childrens[index];
        },
      ),
    );
  }
}
