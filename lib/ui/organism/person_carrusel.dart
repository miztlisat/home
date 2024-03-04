import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:miztli/core/data.dart';
import 'package:miztli/ui/molecules/person_card.dart';

class PersonCarousel extends StatefulWidget {
  const PersonCarousel({
    super.key,
  });

  @override
  State<PersonCarousel> createState() => _PersonCarouselState();
}

class _PersonCarouselState extends State<PersonCarousel> {
  ScrollController controller = ScrollController();

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      // La acción que deseas realizar cada 2 segundos
      controller.animateTo(controller.offset + 300,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    });
  } // Número total de elementos en la lista

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemBuilder: (context, index) {
          final actualIndex = index % persons.length;
          return PersonCard(person: persons[actualIndex]);
        },
      ),
    );
  }
}