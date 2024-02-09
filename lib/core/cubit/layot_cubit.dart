import 'package:examplaapplication2024/core/cubit/layout_states.dart';

import 'package:examplaapplication2024/feature/tabbar/mixed/model/mixed_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<CubitUserStates> {
  List<String> _words = [];
  List<String> get words => _words;
  List<Products> products = [];

  FavoriteCubit(this.products, CubitUserStates initialState)
      : super(initialState);

  void getData(String word) {
    final isExist = _words.contains(word);
    if (isExist) {
      _words.remove(word);
    } else {
      _words.add(word);
    }
    emit(FavoriteStates());
  }

  bool isExist(String word) {
    final exists = _words.contains(word);
    return exists;
  }

  void clearFavorite() {
    _words = [];
    emit(FavoriteStates());
  }
}
