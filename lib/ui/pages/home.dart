import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miztli/ui/views/about_us.dart';
import 'package:miztli/ui/views/gallery.dart';
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
    const Gallery(),
    const PrevEventMiztli(),
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
                    addAutomaticKeepAlives: true,
                    addRepaintBoundaries: false,
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

class PrevEventMiztli extends StatefulWidget {
  const PrevEventMiztli({super.key});

  @override
  State<PrevEventMiztli> createState() => _PrevEventMiztliState();
}

class _PrevEventMiztliState extends State<PrevEventMiztli> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/2020.mp4',
    )..initialize().then((_) {
        // Garantiza que el primer fotograma se muestre después de que el video se haya inicializado.
        setState(() {
          _controller.play();
          _controller.setVolume(0.0);
        });
      });

    // Configurar el controlador de video para que se reinicie al finalizar.
    _controller.addListener(() {
      if (_controller.value.position >= _controller.value.duration) {
        _controller.seekTo(Duration.zero);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 150,
          vertical: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CanSat CUCEI 2020",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 50,
              ),
            ),
            Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
