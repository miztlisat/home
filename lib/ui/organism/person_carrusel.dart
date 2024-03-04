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

  late Timer timer;

  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();

      // Esto se ejecutará después de que el widget haya sido construido
      // y la vista de desplazamiento esté completamente cargada.

      // La acción que deseas realizar cada 2 segundos
      timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
        controller.animateTo(controller.offset + 300,
            duration: const Duration(milliseconds: 500), curve: Curves.linear);
      });

    // El resto de tu lógica de initState si es necesario.
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        key: UniqueKey(),
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
