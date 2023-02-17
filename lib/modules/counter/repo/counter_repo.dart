import 'package:counter/modules/counter/data_sources/counter_data.dart';

class CounterRepo{
  CounterDataSource ? counterDataSource;
  CounterRepo(this.counterDataSource);
  void setIncrementCounter(counter){
   counterDataSource!.setCounterValue(key: 'counter', value:counter);
  }
  void setDecrementCounter(counter){
    counterDataSource!.setCounterValue(key: 'counter', value:counter);
  }
  int? getCounter(){
    return counterDataSource!.getCounterValue(key:'counter');
  }
}