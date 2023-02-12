import 'package:counter/buisness_logic/counter_cubit/counter_cubit.dart';
import 'package:counter/buisness_logic/counter_states/counter_states.dart';
import 'package:counter/constants/variables.dart';
import 'package:counter/data/repository/shared_pre.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
   CounterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
    appBar: AppBar(
      title: const Text('Counter App',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30)),
    backgroundColor: Colors.deepPurple,
      elevation: 0,
      centerTitle: true,
    ),
    body: SafeArea(
        child: Center(
          child: BlocBuilder<CounterCubit,CounterState>(
            builder: (context,state){
              counter=CacheHelper.getData(key: 'counter');
              var cubit= BlocProvider.of<CounterCubit>(context);
              return  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  state is LoadingSaveState ?
                  DelayedWidget(
                    enabled: true,
                    delayDuration: Duration(milliseconds: 1000),
                      child: CircularProgressIndicator()):
                  Text('$counter',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
                  const SizedBox(
                    height: 29,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        mini: true,
                        onPressed: (){
                          cubit.incrementCounter();
                        },backgroundColor: Colors.white,child:const Text('+',style: TextStyle(color: Colors.black,fontSize: 23)),) ,
                      const SizedBox(width: 25,),
                      FloatingActionButton(
                        mini: true,
                        onPressed: (){
                          cubit.decrementCounter();
                        },backgroundColor: Colors.white,child:const Text('-',style: TextStyle(color: Colors.black,fontSize: 23)),)
                    ],
                  )
                ],
              );
            },
          ),
        )
    ),
    );
  }
}
