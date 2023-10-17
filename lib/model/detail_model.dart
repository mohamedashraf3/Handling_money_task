import 'package:detaild_task/view_model/utils/imges_online.dart';

class DetailModel {
  List<Data>? data;

  DetailModel({this.data});

  DetailModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? image;
  String? name;
  int? amountSpent;
  int? totalBudget;
  List<Transaction>? transaction;

  Data(
      {this.image,
      this.name,
      this.amountSpent,
      this.totalBudget,
      this.transaction});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    amountSpent = json['amountSpent'];
    totalBudget = json['totalBudget'];
    if (json['transaction'] != null) {
      transaction = <Transaction>[];
      json['transaction'].forEach((v) {
        transaction!.add(Transaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['amountSpent'] = amountSpent;
    data['totalBudget'] = totalBudget;
    if (transaction != null) {
      data['transaction'] = transaction!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transaction {
  String? image;
  String? name;
  double? cost;

  Transaction({this.image, this.name, this.cost});

  Transaction.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['cost'] = cost;
    return data;
  }
}

Map<String, dynamic> detailMap = {
  'data': [
    {
      'image': Images.groceries,
      'name': 'Groceries',
      'amountSpent': 21,
      'totalBudget': 400,
      'transaction': [
        {
          'image': Images.groceries,
          'name': 'Tesco',
          'cost': 8.99,
        },
        {
          'image': Images.groceries,
          'name': 'Pet Shop',
          'cost': 11.30,
        },
        {
          'image': Images.groceries,
          'name': "Tom's Vegetables",
          'cost': 3.19,
        },
        {
          'image': Images.groceries,
          'name': 'Tesco',
          'cost': 13.45,
        },
        {
          'image': Images.groceries,
          'name': 'Bakery',
          'cost': 9.99,
        },
        {
          'image': Images.groceries,
          'name': 'Cakes & Donuts',
          'cost': 11.30,
        },
        {
          'image': Images.groceries,
          'name': 'pharmacy',
          'cost': 9.19,
        },
      ],
    }
  ]
};
