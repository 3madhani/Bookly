import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'similar_book_list_view.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            "You can also like",
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w900,
              fontFamily: "GT Sectra Fine",
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SimilarBooksListView(),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
