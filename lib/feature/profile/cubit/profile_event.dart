import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();
}

class LoadUserProfile extends UserProfileEvent {
  @override
  List<Object?> get props => [];
}

class UpdateUserProfile extends UserProfileEvent {
  final String username;
  final String description;

  UpdateUserProfile({required this.username, required this.description});

  @override
  List<Object?> get props => [username, description];
}

abstract class UserProfileState extends Equatable {
  const UserProfileState();
}

class UserProfileInitial extends UserProfileState {
  @override
  List<Object?> get props => [];
}

class UserProfileLoaded extends UserProfileState {
  final String username;
  final String description;

  UserProfileLoaded({required this.username, required this.description});

  @override
  List<Object?> get props => [username, description];
}

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());

  void loadUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? '';
    String description = prefs.getString('description') ?? '';
    emit(UserProfileLoaded(username: username, description: description));
  }

  void updateUserProfile(String username, String description) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('description', description);
    emit(UserProfileLoaded(username: username, description: description));
  }
}
