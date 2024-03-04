import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miztli/core/settings.dart';
import 'package:miztli/ui/organism/person_carrusel.dart';
import 'package:miztli/ui/providers/language_provider.dart';

class AboutUs extends ConsumerWidget {
  const AboutUs({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final language = ref.watch(languageProvider);
    return SizedBox(
      height: 1000,
      child: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.onSecondary,
            padding: EdgeInsets.symmetric(
              horizontal: size.width > 780 ? size.width / 6 : 20,
              vertical: 50,
            ),
            child: Column(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: Text(
                    language == Languages.en
                        ? settings.about_us_en
                        : settings.about_us_es,
                    key: UniqueKey(),
                    style: GoogleFonts.outfit(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Text(
                    language == Languages.en
                        ? settings.about_us_description_en
                        : settings.about_us_description_es,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const PersonCarousel(),
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 178, 162, 186),
            padding: EdgeInsets.symmetric(
              horizontal: size.width > 780 ? size.width / 6 : 20,
              vertical: 50,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/galery/about_us.jpg',
                  height: 300,
                ),
                Expanded(
                  child: Column(
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: Text(
                          language == Languages.en
                              ? settings.what_do_we_do_en
                              : settings.what_do_we_do_es,
                          key: UniqueKey(),
                          style: GoogleFonts.outfit(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: Text(
                          language == Languages.en
                              ? settings.what_do_we_do_description_en
                              : settings.what_do_we_do_description_es,
                          //key: UniqueKey(),
                          style: GoogleFonts.outfit(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
