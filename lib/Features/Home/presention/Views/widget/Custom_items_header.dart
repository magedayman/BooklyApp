import 'package:bookly/core/constant/Assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomItemsListHeader extends StatelessWidget {
  final String imagUrl;
  const CustomItemsListHeader({
    super.key,
    required this.imagUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.6 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            placeholder: (context, url) => Center(
                child: Lottie.asset(AppAssets.lottieProgressIndicator,
                    height: 100, width: 100)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.fill,
            imageUrl: imagUrl,
          ),
        ));
  }
}
