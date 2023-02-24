import 'package:counter/modules/counter/blocs/counter_bloc.dart';
import 'package:counter/modules/counter/data_sources/counter_data.dart';
import 'package:counter/modules/counter/repo/counter_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class  DependencyInjection {
 static final sl=GetIt.instance;
 static void initId(SharedPreferences sharedPreferences){
    sl.registerSingleton(sharedPreferences);
    sl.registerSingleton(CounterDataSource(sl.get<SharedPreferences>()));
    sl.registerSingleton(CounterRepo(sl.get()));
    sl.registerFactory(() => CounterCubit(sl.get()));
  }
}