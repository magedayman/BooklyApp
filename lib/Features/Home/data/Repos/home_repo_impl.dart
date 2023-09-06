import 'package:bookly/Features/Home/data/Repos/home_repos.dart';
import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly/core/shared/Failures.dart';
import 'package:bookly/core/shared/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepository {
  ApiService apiService;
  HomeRepoImpl(this.apiService);

  List<BookModel> booksData = [];

  @override
  Future<Either<Failures, List<BookModel>>> fetchBookDataItemsHeader() async {
    try {
      var response = await apiService.getdata(
          endPoint:
              "volumes?Filtering=free-ebooks&Sorting=newest &q=subject:programming");

      for (var books in response["items"]) {
        booksData.add(BookModel.fromJson(books));
      }

      return right(booksData);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return Left(ServerFailures.fromDioError(e));
      }
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchBestSellerBooksList() async {
    try {
      var response = await apiService.getdata(
          endPoint:
              "volumes?Filtering=free-ebooks&Sorting=newest &q=computer science");

      List<BookModel> booksData = [];

      for (var books in response["items"]) {
        try {
          booksData.add(BookModel.fromJson(books));
        } catch (e) {
          print(books);
          // TODO
        }
      }

      return right(booksData);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return Left(ServerFailures.fromDioError(e));
      }
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchSimillerBooks(
      {required String category}) async {
    try {
      var response = await apiService.getdata(
          endPoint:
              "volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:programming");

      for (var books in response["items"]) {
        booksData.add(BookModel.fromJson(books));
      }

      return right(booksData);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return Left(ServerFailures.fromDioError(e));
      }
      return Left(ServerFailures(e.toString()));
    }
  }
}
