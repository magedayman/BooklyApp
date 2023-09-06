import 'package:bookly/core/constant/Assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LottieBuilder.asset(
      AppAssets.lottieProgressIndicator,
      height: 100,
      width: 100,
    ));
  }
}
