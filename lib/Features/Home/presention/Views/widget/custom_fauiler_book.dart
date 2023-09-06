import 'package:bookly/core/constant/styles.dart';
import 'package:flutter/material.dart';

class CustomFauilerBook extends StatelessWidget {
  const CustomFauilerBook({super.key, required this.errMessage});

  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      errMessage,
      style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
    ));
  }
}
