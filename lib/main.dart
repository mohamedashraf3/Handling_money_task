import 'package:detaild_task/view/screens/home.dart';
import 'package:detaild_task/view_model/bloc/detail_cubit/detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  runApp( MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => DetailCubit(),),
    ],
    child: const MaterialApp(
      home:HomeScreen() ,
      debugShowCheckedModeBanner: !true,
    ),
  ));
}