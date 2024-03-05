// ignore_for_file: non_constant_identifier_names

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miztli/ui/providers/language_provider.dart';
import 'package:miztli/ui/providers/scroll_controller.dart';
import 'package:miztli/ui/providers/theme_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final isDarkMode = ref.watch(isDarkModeProvider);
    final language = ref.watch(languageProvider);

    final scrollController = ref.watch(scrollControllerProvider);

    return Container(
      color: isDarkMode
          ? const Color.fromARGB(248, 30, 30, 30)
          : Theme.of(context).scaffoldBackgroundColor,
      height: 100,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
          horizontal: size.width > 500 ? size.width / 6 : 20),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width > 1000
                  ? MediaQuery.of(context).size.width / 5
                  : null,
              child: Row(
                children: [
                  Image.asset(
                    isDarkMode
                        ? "assets/aafi_icon_light.png"
                        : "assets/aafi_icon_dark.png",
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape
                            .circle, // Establece la forma del contenedor como un círculo
                        color: Colors
                            .white, // Establece el color de fondo como blanco
                      ),
                      padding: const EdgeInsets.all(4),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/icon.png",
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                  if (size.width > 570)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: GestureDetector(
                        child: Text(
                          'Miztli SAT',
                          style: GoogleFonts.outfit(
                            fontSize: 25,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        onTap: () {
                          scrollController.scrollTo(
                            index: 0,
                            duration: const Duration(milliseconds: 500),
                          );
                        },
                      ),
                    )
                ],
              ),
            ),
            MediaQuery.of(context).size.width > 1200
                ? Expanded(
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Flexible(
                              flex: 1,
                              child: AppBarButton(
                                label_en: 'About Us',
                                label_es: "Nosostros",
                                index: 1,
                              ),
                            ),
                            const Flexible(
                              flex: 1,
                              child: AppBarButton(
                                label_es: 'Galeria',
                                label_en: "Gallery",
                                index: 2,
                              ),
                            ),
                            const Flexible(
                              flex: 1,
                              child: AppBarButton(
                                label_es: 'Donación',
                                label_en: 'Donation',
                                index: 3,
                                url: 'https://donadora.org/campanas/unam-conquista-aeroespacial',
                              ),
                            ),
                            const Flexible(
                              flex: 1,
                              child: AppBarButton(
                                label_es: "Contactanos",
                                label_en: "Contact us",
                                index: 4,
                              ),
                            ),
                            const Flexible(
                              flex: 1,
                              child: ThemeButton(),
                            ),
                            IconButton(
                              icon: Text(
                                language == Languages.es ? "ES" : "EN",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              onPressed: () {
                                if (language == Languages.es) {
                                  ref.read(languageProvider.notifier).state =
                                      Languages.en;
                                } else {
                                  ref.read(languageProvider.notifier).state =
                                      Languages.es;
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class ThemeButton extends ConsumerWidget {
  const ThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: IconButton(
        icon: Icon(
          isDarkMode ? EvaIcons.moon : EvaIcons.sun,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: () {
          ref.read(isDarkModeProvider.notifier).state =
              !ref.read(isDarkModeProvider);
        },
      ),
    );
  }
}

class AppBarButton extends ConsumerStatefulWidget {
  const AppBarButton({
    super.key,
    required this.label_es,
    required this.label_en,
    this.index = 0,
    this.url = '',
  });

  final String label_en;
  final String label_es;
  final int index;
  final String url;

  @override
  ConsumerState<AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends ConsumerState<AppBarButton> {
  bool isHovered = false;

  Color getHoveredColor() {
    final isDarkMode = ref.watch(isDarkModeProvider);
    if (isDarkMode) {
      return const Color.fromARGB(255, 56, 56, 56);
    }
    return const Color.fromARGB(255, 192, 193, 195);
  }

  Future<void> _externalLaunchUrl() async {
    if (!await launchUrl(Uri.parse(widget.url))) {
      throw Exception('Could not launch $widget.url');
    }
  }

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
          if (widget.url != '') {
            _externalLaunchUrl();
          } else {
            scrollController.scrollTo(
              index: widget.index,
              duration: const Duration(milliseconds: 500),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: isHovered ? getHoveredColor() : Colors.transparent,
              borderRadius: BorderRadius.circular(5.0)),
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.2, 0), // Abajo
                  end: const Offset(0, 0), // Arriba
                ).animate(animation),
                child: child,
              );
            },
            child: Text(
              language == Languages.en ? widget.label_en : widget.label_es,

              ///key: UniqueKey(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      ),
      onEnter: (e) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (e) {
        setState(() {
          isHovered = false;
        });
      },
    );
  }
}
