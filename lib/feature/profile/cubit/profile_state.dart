import 'package:equatable/equatable.dart';

class ProfilState extends Equatable {
  final String username;
  final String description;
  final bool isSavedSuccessfully;

  const ProfilState({
    this.username = '',
    this.description = '',
    this.isSavedSuccessfully = false,
  });

  @override
  List<Object?> get props => [username, description, isSavedSuccessfully];

  ProfilState copyWith({
    String? username,
    String? description,
    bool? isSavedSuccessfully,
  }) {
    return ProfilState(
      username: username ?? this.username,
      description: description ?? this.description,
      isSavedSuccessfully: isSavedSuccessfully ?? this.isSavedSuccessfully,
    );
  }
}
