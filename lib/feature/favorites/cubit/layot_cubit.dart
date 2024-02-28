import 'package:examplaapplication2024/feature/favorites/cubit/layout_states.dart';
import 'package:examplaapplication2024/feature/tabbar_contents/mixed/model/mixed_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tabbar_contents/female/model/female_model.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final List<Products> _favorites = [];
  final List<FemaleModel> _female = [];

  FavoritesCubit() : super(FavoritesInitial());

  List<Products> get favorites => _favorites;

  void toggleFavorites(Products product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    emit(FavoritesUpdatedState(List.from(_favorites)));
  }

  bool isExist(Products product) {
    return _favorites.contains(product);
  }

  static FavoritesCubit of(BuildContext context) {
    return context.read<FavoritesCubit>();
  }

  void toggleFavoritesFemale(FemaleModel female) {
    if (_female.contains(female)) {
      _female.remove(female);
    } else {
      _female.add(female);
    }
    emit(FavoritesUpdatedState(List.from(_female)));
  }

  bool isExistFemale(FemaleModel female) {
    return _female.contains(female);
  }
}
