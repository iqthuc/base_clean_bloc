import 'package:base_clean_bloc/common/data/share_preferences/app_preferences.dart';
import 'package:base_clean_bloc/di/di_setup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_bloc_state.dart';

abstract class BaseBloc<E, S extends BaseBlocState> extends Bloc<E, S> {
  BaseBloc(super.initialState);
  final localPref = getIt<AppPreferences>();
  // final connectivity = Connectivity().onConnectivityChanged;
}
