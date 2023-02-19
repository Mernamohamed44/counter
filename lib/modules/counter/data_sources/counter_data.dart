import 'package:shared_preferences/shared_preferences.dart';

class CounterDataSource{
    SharedPreferences ?sharedPreferences;
    CounterDataSource(this.sharedPreferences);

    int? get  counter => sharedPreferences!.getInt('counter');
    void decrementCounterValue(){
      sharedPreferences!.setInt('counter', counter!-1);
    }
    void incrementCounterValue(){
      sharedPreferences!.setInt('counter', counter! +1);
    }
}