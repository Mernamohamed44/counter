import 'package:counter/modules/counter/blocs/counter_bloc.dart';
import 'package:counter/modules/counter/data_sources/counter_data.dart';
import 'package:counter/modules/counter/repo/counter_repo.dart';
import 'package:counter/modules/counter/ui/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences? sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences=await SharedPreferences.getInstance();
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (BuildContext context) => CounterCubit(CounterRepo(
           CounterDataSource(
             sharedPreferences
           )
        )),
        child: CounterScreen(),
      ),
    );
  }
}
