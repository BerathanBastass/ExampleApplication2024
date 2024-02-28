import 'package:examplaapplication2024/feature/tabbar_contents/mixed/model/mixed_models.dart';

abstract class FavoritesState {
  const FavoritesState();
}

class FavoritesInitial extends FavoritesState {}

class FavoritesUpdatedState extends FavoritesState {
  final List<Products> favorites;

  FavoritesUpdatedState(this.favorites);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesUpdatedState &&
          runtimeType == other.runtimeType &&
          favorites == other.favorites;

  @override
  int get hashCode => favorites.hashCode;
}

abstract class CubitUserStates {}

class FavoriteStates extends CubitUserStates {}

class CubitUsersLoaded extends FavoriteStates {}
