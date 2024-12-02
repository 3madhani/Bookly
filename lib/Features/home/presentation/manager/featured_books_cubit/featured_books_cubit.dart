import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks({required String subject}) async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks(subject: subject);

    result.fold((failure) {
      emit(
        FeaturedBooksFailure(
          errMessage: failure.errMessage,
        ),
      );
    }, (books) {
      emit(
        FeaturedBooksSuccess(
          books: books,
        ),
      );
    });
  }
}
