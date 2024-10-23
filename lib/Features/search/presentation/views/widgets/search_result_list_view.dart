import 'package:bookly/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly/Features/search/presentation/manager/cubit/searched_books_cubit.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
        builder: (context, state) {
      if (state is SearchedBooksInitial) {
        // Show an empty state or message
        return const Center(
          child: Text('Start searching for books!'),
        );
      } else if (state is SearchedBooksSuccess) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: state.books.length,
          itemBuilder: (context, index) {
            if (index < state.books.length) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BooksListViewItem(
                  book: state.books[index], // Safe to access here
                ),
              );
            } else {
              return const SizedBox
                  .shrink(); // Return an empty widget if out of bounds
            }
          },
        );
      } else if (state is SearchedBooksFailure) {
        return CustomErrorWidget(errorMessage: state.errMessage);
      } else {
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: ShimmerBookItem());
            });
      }
    });
  }
}
