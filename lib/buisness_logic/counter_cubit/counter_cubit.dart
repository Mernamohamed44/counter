import 'package:counter/buisness_logic/counter_states/counter_states.dart';
import 'package:counter/constants/variables.dart';
import 'package:counter/data/repository/shared_pre.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit() : super(InitialState());
  incrementCounter(){
    counter=counter+1;
    emit(IncrementState());
    CacheHelper.saveData(key: 'counter', value: counter);
    emit(LoadingSaveState());
    counter=CacheHelper.getData(key: 'counter');
    emit(SuccessSaveState());
  }
  decrementCounter(){
    counter=counter-1;
    emit(DecrementState());
    CacheHelper.saveData(key: 'counter', value: counter);
    emit(LoadingSaveState());
    counter=CacheHelper.getData(key: 'counter');
    emit(SuccessSaveState());
  }

}