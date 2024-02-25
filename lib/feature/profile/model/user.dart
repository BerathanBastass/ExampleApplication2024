class ProfilState {
  final String username;
  final String description;

  ProfilState({this.username = "", this.description = ""});

  ProfilState copyWith(
      {String? username,
      String? description,
      required bool isSavedSuccessfully}) {
    return ProfilState(
      username: username ?? this.username,
      description: description ?? this.description,
    );
  }
}
