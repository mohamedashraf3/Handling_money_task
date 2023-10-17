import 'package:flutter/material.dart';
import '../../../view_model/utils/app_colors.dart';
import '../../../view_model/utils/imges_online.dart';
import '../text_custom.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextCustom(
            text: 'You have already spent',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Image.network(
                  Images.dollar,
                  width: 50,
                ),
                const SizedBox(width: 10),
                const TextCustom(
                  text: '\$12,000.00',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          TextCustom(
            text: "and there's still 18 days left until payday",
            color: AppColors.grey.withOpacity(0.9),
            fontSize: 18,
          ),
        ],
      ),
    );
  }
}