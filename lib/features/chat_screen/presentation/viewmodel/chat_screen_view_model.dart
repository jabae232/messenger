
import 'package:flutter/material.dart';
import 'package:messanger/constants/app_colors.dart';

class ChatScreenViewModel extends ChangeNotifier{
  bool _isVisible = true;

  final List<Color> _colors = [
    AppColors.red,
    AppColors.blue,
    AppColors.green,
    AppColors.defaultBlack,
  ];

  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Color> get colors => _colors;

  TextEditingController get searchController => _searchController;

  bool get isVisible => _isVisible;

  set isVisible(bool value) {
    _isVisible = value;
  }
}

