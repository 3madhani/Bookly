import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'type_of_books_list.dart';
import 'newest_books_list_view.dart';
import 'featured_book_list_view.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const TypeOfBooksList(
                booksType: booksType,
              ),
              const FeaturedBookListView(),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Text(
                  "Newest Books",
                  style: Styles.textStyle18.copyWith(
                    fontFamily: 'GT Sectra Fine',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: NewestBooksListView(),
          ),
        ),
      ],
    );
  }
}
