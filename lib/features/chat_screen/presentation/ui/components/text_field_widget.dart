import 'package:flutter/material.dart';
import 'package:messanger/constants/app_colors.dart';
import 'package:messanger/constants/app_styles.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.hintText,
    this.prefixIcon,
    this.isSearch = false,
  }) : super(key: key);
  final TextEditingController controller;
  final Function(String) onChanged;
  final String hintText;
  final Widget? prefixIcon;
  final bool isSearch;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      maxLines: isSearch ? 1 : 10,
      textInputAction: isSearch ? TextInputAction.search : TextInputAction.newline,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 11.5,horizontal: 12),
        prefixIcon: prefixIcon,
        hintText: hintText,
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
