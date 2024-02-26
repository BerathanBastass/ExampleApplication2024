import 'package:equatable/equatable.dart';

import 'package:examplaapplication2024/feature/users/model/users_model.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class InitUsersState extends UsersState {}

class LoadingUsersState extends UsersState {}

class ErrorUsersState extends UsersState {
  final String message;
  ErrorUsersState(this.message);

  @override
  List<UserModel> get props => [];
}

class ResponseUsersState extends UsersState {
  final List<UserModel> users;
  ResponseUsersState(this.users);

  @override
  List<Object> get props => [users];
}
