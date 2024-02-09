import 'package:bloc/bloc.dart';

import '../model/user.dart';

class ProfilCubit extends Cubit<ProfilState> {
  ProfilCubit() : super(ProfilState());

  void updateUsername(String newUsername) {
    emit(state.copyWith(username: newUsername));
  }

  void updateDescription(String newDescription) {
    emit(state.copyWith(description: newDescription));
  }

  void saveChanges() {}
}
