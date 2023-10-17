import 'package:detaild_task/model/detail_model.dart';
import 'package:detaild_task/view_model/utils/imges_online.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_states.dart';

class DetailCubit extends Cubit<DetailStates> {
  DetailCubit() : super(InitialStates());

  static DetailCubit get(context) => BlocProvider.of<DetailCubit>(context);
  List<Data> detail = [
    Data(
        image: Images.groceries,
        name: 'Groceries',
        amountSpent: 21,
        totalBudget: 400,
        transaction: [
          Transaction(image: Images.tesco, name: 'Tesco', cost: 8.99),
          Transaction(image: Images.pet, name: 'Pet Shop', cost: 11.30),
          Transaction(
              image: Images.vegetables, name: "Tom's Vegetables", cost: 3.19),
          Transaction(image: Images.pharmacy, name: 'Pharmacy', cost: 13.45),
          Transaction(image: Images.bakery, name: 'Bakery', cost: 9.99),
        ]),
  ];
  bool isTransactionVisible = false;

  void transactionVisible() {
    isTransactionVisible = !isTransactionVisible;
    emit(VisibilityStates());
  }
}
