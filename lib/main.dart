import 'package:counter/di.dart';
import 'package:counter/modules/counter/blocs/counter_bloc.dart';
import 'package:counter/modules/counter/ui/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences? sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences=await SharedPreferences.getInstance();
  DependencyInjection.initId(sharedPreferences!);

  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (BuildContext context) => DependencyInjection.sl.get<CounterCubit>(),
        child: CounterScreen(),
      ),
    );
  }
}
