import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constant/Assets.dart';

class CustomBookDetailsitem extends StatelessWidget {
  const CustomBookDetailsitem({
    super.key,
    required this.bookmodel,
  });

  final BookModel bookmodel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.6 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
              fit: BoxFit.fill,
              placeholder: (context, url) => Center(
                  child: Lottie.asset(AppAssets.lottieProgressIndicator,
                      height: 100, width: 100)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: bookmodel.volumeInfo!.imageLinks!.thumbnail.toString()),
        ));
  }
}
