import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/search/data/repo/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'searched_books_state.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  SearchedBooksCubit(this.searchRepo) : super(SearchedBooksLoading());
  final SearchRepo searchRepo ;

  void fetchSearchBooks({required String query}) async {
    emit(SearchedBooksLoading());
    var result = await searchRepo.fetchSearchedBooks(query: query);

    result.fold((failure) {
      emit(
        SearchedBooksFailure(
          errMessage: failure.errMessage,
        ),
      );
    }, (books) {
      emit(
        SearchedBooksSuccess(
          books: books,
        ),
      );

    });
  }
  void resetSearch() {
    emit(SearchedBooksInitial());
  }
}
