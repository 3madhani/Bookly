import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo,) : super(NewestBooksInitial());

  final HomeRepo homeRepo;
  

  Future<void> fetchNewestBooks({final String subject = "fiction"} ) async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchBestNewestBooks(subject: subject);

    result.fold((failure) {
      emit(
        NewestBooksFailure(
          errMessage: failure.errMessage,
        ),
      );
    }, (books) {
      emit(
        NewestBooksSuccess(
          books: books,
        ),
      );
    });
  }
}
