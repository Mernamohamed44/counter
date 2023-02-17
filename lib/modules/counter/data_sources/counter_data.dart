import 'package:shared_preferences/shared_preferences.dart';

class CounterDataSource{
    SharedPreferences ?sharedPreferences;
    CounterDataSource(this.sharedPreferences);
    int? getCounterValue({required String key}){
        int? counter;
        try{
            counter= sharedPreferences!.getInt(key);
         }
        catch(error){
            print('error is ${error.toString()}');
        }
        return counter;
    }
    void setCounterValue({required String key,required int value}){
       try{
           sharedPreferences!.setInt(key, value);
       }
       catch(error){
           print(error.toString());
       }
    }
}