import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di_setup.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void initSharePreferences() async {
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
}

void configureDependencies({String env = Environment.dev}) async {
  initSharePreferences();
  $initGetIt(getIt, environment: env);
}
