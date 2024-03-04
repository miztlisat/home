import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miztli/ui/providers/language_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NextEventMiztli extends ConsumerWidget {
  const NextEventMiztli({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final language = ref.watch(languageProvider);

    return Container(
      width: size.width,
      height: size.height - 100,

      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/gallery/miztlisat_2023.png"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Color.fromARGB(255, 122, 119, 119),
            BlendMode.modulate,
          ),
        ),
      ),
      child: Container(
        width: 590,
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              language == Languages.es
                  ? "Próxima competencia"
                  : "Next competition",
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width > 500 ? 30 : 20,
              ),
            ),
            Text(
              "Cansat Competition 2024",
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width > 500 ? 50 : 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (!await launchUrl(
                    Uri.parse("https://cansatcompetition.com/"))) {
                  throw Exception(
                      'Could not launch https://cansatcompetition.com/');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Bordes redondeados
                ),
              ),
              child: Text(
                language == Languages.es ? 'Ver mas' : 'See more',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
