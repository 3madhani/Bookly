import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
   final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchFeaturedSimilarBooks(category: category);

    result.fold((failure) {
      emit(
        SimilarBooksFailure(
          errMessage: failure.errMessage,
        ),
      );
    }, (books) {
      emit(
        SimilarBooksSuccess(
          books: books,
        ),
      );
    });
  }
}
