import 'package:bookly/Features/search/presentation/manager/cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a TextEditingController to manage the text field input
    final TextEditingController searchController = TextEditingController();

    return TextField(
      onTap: () {
        final query = searchController.text.trim(); // Get the search query
        if (query.isNotEmpty) {
          // Only fetch if the query is not empty
          BlocProvider.of<SearchedBooksCubit>(context).fetchSearchBooks(
            query: query, // Pass the query to the cubit
          );
        }
      },
      controller: searchController, // Assign the controller to the TextField
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {
            final query = searchController.text.trim(); // Get the search query
            if (query.isNotEmpty) {
              // Only fetch if the query is not empty
              BlocProvider.of<SearchedBooksCubit>(context).fetchSearchBooks(
                query: query, // Pass the query to the cubit
              );
            }
          },
          icon: Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: Colors.white.withOpacity(0.8),
            size: 24,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(
        12,
      ),
    );
  }
}
