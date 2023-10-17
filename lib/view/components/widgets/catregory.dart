import 'package:flutter/material.dart';

import '../../../view_model/bloc/detail_cubit/detail_cubit.dart';
import '../../../view_model/utils/app_colors.dart';
import '../text_custom.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.image,
    required this.category,
    required this.amountSpent,
    required this.totalBudget,
    this.onPressed,
  })  : remainingBudget = amountSpent - totalBudget,
        super(key: key);

  final void Function()? onPressed;
  final String image, category;
  final int amountSpent, totalBudget, remainingBudget;

  @override
  Widget build(BuildContext context) {
    var cubit = DetailCubit.get(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(image, width: 130, height: 130),
          Column(
            children: [
              TextCustom(
                text: category,
                color: AppColors.grey,
                fontWeight: FontWeight.bold,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Row(
                  children: [
                    TextCustom(
                        text: '\$$amountSpent', fontWeight: FontWeight.bold),
                    TextCustom(
                      text: '/  \$$totalBudget',
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey,
                    ),
                  ],
                ),
              ),
              TextCustom(
                text: '- \$$remainingBudget ',
                color: AppColors.red,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 75),
                  child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      cubit.isTransactionVisible
                          ? Icons.arrow_drop_up_outlined
                          : Icons.arrow_drop_down_outlined,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
