import 'dart:math';
import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypeOfBooksList extends StatefulWidget {
  const TypeOfBooksList({
    super.key,
    required this.booksType,
    this.stringColor = const Color.fromARGB(255, 99, 97, 97),
  });

  final List<String> booksType;
  final Color stringColor;

  @override
  State<TypeOfBooksList> createState() => _TypeOfBooksListState();
}

class _TypeOfBooksListState extends State<TypeOfBooksList> {
  int _selectedIndex = 0; // Initial index to underline the first item
  Color? _currentStringColor; // Variable to store the current string color
  // String? _subject;

  // Random number generator
  final Random _random = Random();
  static const double _itemPadding = 12.0;
  static const double _underlineHeight = 1.5;

// Method to generate a random color
  Color _getRandomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _currentStringColor = _getRandomColor();
      // _subject = booksType[index];
    });
    final String selectedBookType = widget.booksType[index];
    context
        .read<NewestBooksCubit>()
        .fetchNewestBooks(subject: selectedBookType);

    context
        .read<FeaturedBooksCubit>()
        .fetchFeaturedBooks(subject: selectedBookType);

  }

  Color _getUnderlineColor(int index) {
    return _selectedIndex == index ? Colors.white : kPrimaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            // Your ListView or other content goes here
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
              child: ListView.builder(
                itemCount: widget.booksType.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final String bookType = widget.booksType[index];

                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: _itemPadding),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => _onItemTapped(index),
                          child: Text(
                            bookType,
                            style: Styles.textStyle18.copyWith(
                              color: _selectedIndex == index
                                  ? _currentStringColor
                                  : widget.stringColor,
                              fontFamily: 'GT Sectra Fine',
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final double textWidth = (TextPainter(
                              text: TextSpan(
                                text: bookType,
                                style: Styles.textStyle18.copyWith(
                                  fontFamily: 'GT Sectra Fine',
                                ),
                              ),
                              maxLines: 1,
                              textDirection: TextDirection.ltr,
                            )..layout())
                                .size
                                .width;

                            return Container(
                              height: _underlineHeight,
                              width: textWidth,
                              color: _getUnderlineColor(index),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Your additional content can go here, such as a ListView or other widgets
          ],
        ),
      ),
    );
  }
}
