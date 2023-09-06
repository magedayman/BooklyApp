import 'package:bookly/Features/Splash/presention/Views/widgets/Sliding_Text.dart';
import 'package:bookly/core/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/Routes.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});
  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedBuilder(
            animation: image,
            builder: (context, _) {
              return SlideTransition(
                position: image,
                child: SvgPicture.asset(
                  AppAssets.logo,
                  height: 60,
                ),
              );
            }),
        const SizedBox(
          height: 20,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(-2, 0), end: Offset.zero)
            .animate(animationController);
    image = Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
        .animate(animationController);

    animationController.forward();
  }

  @override
  void initState() {
    super.initState();

    initAnimation();

    navigateHome();
  }

  void navigateHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        // Get.off(
        //   () => const HomeView(),
        //   transition: Transition.zoom,
        //   duration: const Duration(milliseconds: 1000),
        // );

        GoRouter.of(context).replace(AppRoutes.homeViewRoute);
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
