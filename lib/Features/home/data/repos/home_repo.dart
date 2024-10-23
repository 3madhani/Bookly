import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBestNewestBooks(
      {required String subject});
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks(
      {required String subject});
  Future<Either<Failure, List<BookModel>>> fetchFeaturedSimilarBooks(
      {required String category});
}
