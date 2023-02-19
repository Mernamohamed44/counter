import 'package:counter/modules/counter/blocs/counter_states.dart';
import 'package:counter/modules/counter/repo/counter_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(this.counterRepo): counter =counterRepo.getCounter(), super(InitialState());
  CounterRepo counterRepo;
  int? counter=0;
  void increment(){
   counter= counterRepo.setIncrementCounter()!;
    emit(IncrementState());
  }
  void decrement(){
   counter= counterRepo.setDecrementCounter()!;
    emit(DecrementState());
  }
}