import 'dart:async';

import 'package:flutter/material.dart';
import 'package:miztli/ui/providers/language_provider.dart';
import 'package:url_launcher/url_launcher.dart';
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
    //const PrevEventMiztli(),
    ContactFotter(),
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
    final language = ref.watch(languageProvider);

    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 1,
                    child: AppBarButton(
                      label_en: 'About Us',
                      label_es: "Nosostros",
                      index: 1,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: AppBarButton(
                      label_es: 'Galeria',
                      label_en: "Gallery",
                      index: 2,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: AppBarButton(
                      label_es: 'Donación',
                      label_en: 'Donation',
                      index: 3,
                      url: 'https://donadora.org/campanas/unam-conquista-aeroespacial',
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: AppBarButton(
                      label_es: "Contactanos",
                      label_en: "Contact us",
                      index: 4,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Flexible(
                    flex: 1,
                    child: ThemeButton(),
                  ),
                  IconButton(
                    icon: Text(
                      language == Languages.es ? "ES" : "EN",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
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
          ],
        ),
      ),
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
/*
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
    _controller = VideoPlayerController.networkUrl(
      Uri.parse('https://github.com/miztlisat/home/raw/main/assets/2020.mp4'),
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
                  : const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
*/
class ContactFotter extends StatelessWidget {
  final String whatsappNumber = '+1234567890'; // Número de WhatsApp

  // URLs de las redes sociales
  final String facebookUrl = 'https://www.facebook.com/tu_facebook';
  final String twitterUrl = 'https://twitter.com/tu_twitter';
  final String instagramUrl = 'https://www.instagram.com/tu_instagram';

  // Método para abrir URLs en el navegador
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir la URL: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(10.0),
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SelectableText(
            "Número: 55-24-82-83-81 ",
            style: TextStyle(
              fontSize: 25,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          SelectableText(
            "Número: 56-10-93-61-16 ",
            style: TextStyle(
              fontSize: 25,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ContactButton(
                img: 'assets/facebook_icon.png',
                url: 'https://www.facebook.com/MiztliSatAAFI/',
              ),
              ContactButton(
                img: 'assets/instagram_icon.png',
                url: 'https://www.instagram.com/miztlisat_aafi/',
              ),
              ContactButton(
                img: 'assets/x_icon.png',
                url: 'https://twitter.com/miztlisat',
              ),
              ContactButton(
                img: 'assets/tiktok_icon.png',
                url: 'https://twitter.com/miztlisat',
              ),
            ],
          ),
          Text(
            '© 2020-2024 Miztli', // Reemplaza con tu propio texto de copyright
            style: TextStyle(
              fontSize: 25,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  const ContactButton({
    super.key,
    required this.img,
    this.url = '',
  });

  final String img;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(
        img,
        height: 45,
      ),
      onTap: () {
        _externalLaunchUrl();
      },
    );
  }

  Future<void> _externalLaunchUrl() async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
