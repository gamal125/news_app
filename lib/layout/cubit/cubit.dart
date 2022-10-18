import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/shared/network/local/cache_helper.dart';

class ModeCubit extends Cubit<ModeStates> {
  ModeCubit() : super(ModeInitialState());

  static ModeCubit get(context) => BlocProvider.of(context);

  bool isDark=true ;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      fromShared =isDark;
      emit(AppChangeModeState());
    } else {

      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        isDark = !isDark;
        emit(AppChangeModeState());
      });
    }
  }
}
