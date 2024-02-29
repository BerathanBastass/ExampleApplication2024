import 'package:examplaapplication2024/feature/favorites/cubit/layout_states.dart';
import 'package:examplaapplication2024/feature/tabbarr/views/mixed/model/mixed_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tabbarr/views/female/model/female_model.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final List<Products> _favorites = [];

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
}
