import 'package:counter/buisness_logic/counter_cubit/counter_cubit.dart';
import 'package:counter/data/repository/shared_pre.dart';
import 'package:counter/presentation/screen/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(const CounterApp());
}
class CounterApp extends StatelessWidget{
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
      create: (BuildContext context)=>CounterCubit(),
      child:  CounterScreen(),),
    );
  }

}