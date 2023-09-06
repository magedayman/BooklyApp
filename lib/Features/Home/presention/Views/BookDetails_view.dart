import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly/Features/Home/presention/Views/BookDetail_view_body.dart';
import 'package:bookly/Features/Home/presention/manger/fetch_similler_books_cubit/fetch_simller_books_Cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookmodel});

  final BookModel bookmodel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<FeatureSimillerBooksCubit>(context).getSimilarBooksData(
        category: widget.bookmodel.volumeInfo!.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(bookModel: widget.bookmodel),
    );
  }
}
