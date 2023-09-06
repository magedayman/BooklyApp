import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constant/Colors.dart';
import '../../../../../core/constant/styles.dart';

class CustomTextFiledSearchView extends StatelessWidget {
  const CustomTextFiledSearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            labelText: "Search",
            labelStyle:
                Styles.textStyle18.copyWith(color: AppColors.kwhiteColor),
            suffixIcon: const Icon(FontAwesomeIcons.magnifyingGlass,
                size: 20, color: AppColors.kwhiteColor),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.kGreyColor, width: .2),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.kGreyColor,
                ),
                borderRadius: BorderRadius.circular(20))));
  }
}
