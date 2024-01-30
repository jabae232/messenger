import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messanger/constants/app_assets.dart';
import 'package:messanger/constants/app_colors.dart';
import 'package:messanger/constants/app_styles.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 11.5),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(9.0),
          child: SvgPicture.asset(
            AppAssets.svg.search,
            color: AppColors.textFieldForeground,
            width: 24,
            height: 24,
          ),
        ),
        hintText: 'Поиск',
        filled: true,
        fillColor: AppColors.textFieldBackground,
        hintStyle:
            AppStyles.s16w500.copyWith(color: AppColors.textFieldForeground),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
