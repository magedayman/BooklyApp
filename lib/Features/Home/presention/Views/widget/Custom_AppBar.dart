import 'package:bookly/core/constant/Routes.dart';
import 'package:bookly/core/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: SafeArea(
        child: Row(
          children: [
            SvgPicture.asset(
              AppAssets.logo,
              height: 25,
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  // Get.to(() => const SearchView(),
                  //     transition: Transition.zoom,
                  //     duration: const Duration(milliseconds: 100));
                  GoRouter.of(context).push(AppRoutes.searchView);
                },
                icon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 20,
                ))
          ],
        ),
      ),
    );
  }
}
