import 'package:shared_preferences/shared_preferences.dart';

class CounterDataSource{
    SharedPreferences ?sharedPreferences;
    CounterDataSource(this.sharedPreferences);
    int? getCounterValue(){
        int? counter;
        try{
            counter= sharedPreferences!.getInt('counter');
         }
        catch(error){
            print('error is ${error.toString()}');
        }
        return counter;
    }
    void decrementCounterValue({required int value}){
       try{
           sharedPreferences!.setInt('counter', value-1);
       }
       catch(error){
           print(error.toString());
       }
    }
    void incrementCounterValue({required int value}){
      try{
        sharedPreferences!.setInt('counter', value+1);
      }
      catch(error){
        print(error.toString());
      }
    }
}