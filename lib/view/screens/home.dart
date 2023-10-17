import 'package:detaild_task/view/components/text_custom.dart';
import 'package:detaild_task/view/components/widgets/item_widget.dart';
import 'package:detaild_task/view_model/bloc/detail_cubit/detail_cubit.dart';
import 'package:detaild_task/view_model/bloc/detail_cubit/detail_states.dart';
import 'package:detaild_task/view_model/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/widgets/catregory.dart';
import '../components/widgets/header_widget.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = DetailCubit.get(context);
    return BlocConsumer<DetailCubit, DetailStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: const TextCustom(text: 'Hi, Mohamed'),
            actions: const [
              Icon(
                Icons.settings_rounded,
                color: AppColors.black,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.more_vert_rounded,
                color: AppColors.black,
                size: 25,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  const HeaderWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CategoryWidget(
                        image: cubit.detail[index].image!,
                        category: cubit.detail[index].name!,
                        amountSpent: cubit.detail[index].amountSpent!,
                        totalBudget: cubit.detail[index].totalBudget!,
                        onPressed: () {
                          cubit.transactionVisible();
                        },
                      );
                    },
                    itemCount: cubit.detail.length,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: cubit.isTransactionVisible,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextCustom(text: 'Recent Transactions'),
                        Container(
                          height: 400,
                          decoration: BoxDecoration(
                            color: AppColors.offwhite,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListView.builder(
                            itemCount: cubit.detail[0].transaction?.length ?? 0,
                            itemBuilder: (context, index) {
                              return ItemWidget(
                                image:
                                    cubit.detail[0].transaction![index].image!,
                                name: cubit.detail[0].transaction![index].name!,
                                cost: cubit.detail[0].transaction![index].cost!,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
