import 'package:counter/modules/counter/data_sources/counter_data.dart';

class CounterRepo{
  CounterDataSource ? counterDataSource;
  CounterRepo(this.counterDataSource);
  int? setIncrementCounter(){
   counterDataSource!.incrementCounterValue();
   return counterDataSource!.counter;
  }
  int? setDecrementCounter(){
    counterDataSource!.decrementCounterValue();
    return counterDataSource!.counter;
  }
  int? getCounter(){
    return counterDataSource!.counter;
  }
}