import 'package:flutter/material.dart';
import 'package:miztli/core/data.dart';
import 'package:miztli/vendor/masory_list_view/masory_list_view.dart';

class Gallery extends StatelessWidget {
  const Gallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 150,
        vertical: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gallery",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 50,
            ),
          ),
          SizedBox(
            height: size.height * 2,
            child: MasonryListViewGrid(
              physics: const NeverScrollableScrollPhysics(),
              column: size.width ~/ 400,
              padding: const EdgeInsets.symmetric(
                vertical: 50,
              ),
              crossAxisGap: 25,
              mainAxisGap: 25,
              children: List.generate(
                100,
                (index) {
                  final actualIndex = index % galleryPictures.length;
                  return SizedBox(
                    height: (300 + (index % 3 == 0 ? 300 : 0)).toDouble(),
                    child: Image.asset(
                      galleryPictures[actualIndex],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
