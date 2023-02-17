import 'package:counter/modules/counter/blocs/counter_states.dart';
import 'package:counter/modules/counter/repo/counter_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(this.counterRepo) : super(InitialState());
  CounterRepo counterRepo;
  int counter=0;
  void increment(){
     counter=counter+1;
    counterRepo.setIncrementCounter(counter);
    emit(IncrementState());
  }
  void decrement(){
    counter=counter-1;
    counterRepo.setDecrementCounter(counter);
    emit(DecrementState());
  }
  int getCounter(){
    counter = counterRepo.getCounter()!;
    emit(GetCounterState());
    return counter;
  }
}