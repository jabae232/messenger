import 'package:flutter/material.dart';
import 'package:messanger/constants/app_styles.dart';

import '../../../../../../../../constants/app_colors.dart';

class SingleChatScreen extends StatelessWidget {
  const SingleChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.chevron_left,
                  color: AppColors.defaultBlack,
                  size: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: CircleAvatar(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Виктор Власов',
                    style: AppStyles.s15w600,
                  ),
                  Text(
                    'В сети',
                    style:
                        AppStyles.s12w500.copyWith(color: AppColors.darkGrey),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: Text('body'),
      ),
    );
  }
}
