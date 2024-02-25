import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class ProfilCubit extends Cubit<ProfilState> {
  ProfilCubit() : super(ProfilState());

  void updateUsername(String newUsername) {
    emit(state.copyWith(username: newUsername, isSavedSuccessfully: true));
  }

  void updateDescription(String newDescription) {
    emit(
        state.copyWith(description: newDescription, isSavedSuccessfully: true));
  }

  Future<void> saveChanges() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Kullanıcı adını ve açıklamayı SharedPreferences'e kaydet
      prefs.setString('username', state.username ?? '');
      prefs.setString('description', state.description ?? '');

      // Başarıyla kaydedildiğinde bir mesajı emit et
      emit(state.copyWith(isSavedSuccessfully: true));
    } catch (e) {
      // Hata durumunda bir mesajı emit et
      emit(state.copyWith(isSavedSuccessfully: false));
    }
  }
}
