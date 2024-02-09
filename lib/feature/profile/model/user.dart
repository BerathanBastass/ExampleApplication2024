class ProfilState {
  final String username;
  final String description;

  ProfilState({this.username = "", this.description = ""});

  ProfilState copyWith({String? username, String? description}) {
    return ProfilState(
      username: username ?? this.username,
      description: description ?? this.description,
    );
  }
}
