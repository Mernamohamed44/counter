import 'package:counter/modules/counter/blocs/counter_states.dart';
import 'package:counter/modules/counter/repo/counter_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(this.counterRepo) : super(InitialState());
  CounterRepo counterRepo;
  int counter=0;
  void increment(){
    counterRepo.setIncrementCounter(counter);
    getCounter();
    emit(IncrementState());
  }
  void decrement(){
    counterRepo.setDecrementCounter(counter);
    getCounter();
    emit(DecrementState());
  }
  void getCounter(){
    counter = counterRepo.getCounter()!;
    emit(GetCounterState());
  }
}