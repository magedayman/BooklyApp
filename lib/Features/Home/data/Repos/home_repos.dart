import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly/core/shared/Failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failures, List<BookModel>>> fetchBookDataItemsHeader();
  Future<Either<Failures, List<BookModel>>> fetchBestSellerBooksList();
  Future<Either<Failures, List<BookModel>>> fetchSimillerBooks(
      {required String category});
}
