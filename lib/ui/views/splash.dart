import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miztli/ui/providers/theme_provider.dart';

class Splash extends ConsumerStatefulWidget {
  const Splash({super.key});

  @override
  ConsumerState<Splash> createState() => _SplashState();
}

class _SplashState extends ConsumerState<Splash> {
  bool _animationStarted = false;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        _animationStarted = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    return Container(
      height: MediaQuery.of(context).size.height,
      color: isDarkMode
          ? const Color.fromARGB(248, 30, 30, 30)
          : Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            transform: _animationStarted
                ? Matrix4.translationValues(
                    0, -MediaQuery.of(context).size.height, 0)
                : Matrix4.translationValues(0, 0, 0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                transform: Matrix4.rotationZ(-45 * 3.1415927 / 180),
                child: Image.asset(
                  'assets/rocket.gif',
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
