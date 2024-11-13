import 'package:reactive_notify/reactive_notify.dart';
import 'package:worksheet/src/auth/model/auth_state.dart';

import 'package:worksheet/src/auth/repository/auth_repository.dart';

class AuthViewModel extends ViewModelImpl<AuthState> {
  final AuthRepository _repository;

  AuthViewModel(this._repository) : super(_repository, AuthState.initial());

  @override
  Future<void> init() async {

    // setState(AuthState.loading());
    // try {
    //   final user = await _repository.getCurrentUser();
    //   if (user != null) {
    //     setState(AuthState.authenticated(user));
    //   } else {
    //     setState(AuthState.unauthenticated());
    //   }
    // } catch (e) {
    //   setState(AuthState.error(e.toString()));
    // }
  }
//
// Future<void> login(String email, String password) async {
//   setState(AuthState.loading());
//   try {
//     final user = await _repository.login(email, password);
//     state = AuthState.authenticated(user);
//   } catch (e) {
//     state = AuthState.error(e.toString());
//   }
// }
//
// Future<void> register(String email, String password, String name) async {
//   state = AuthState.loading();
//   try {
//     final user = await _repository.register(email, password, name);
//     state = AuthState.authenticated(user);
//   } catch (e) {
//     state = AuthState.error(e.toString());
//   }
// }

// Future<void> logout() async {
//   try {
//     await _repository.logout();
//     state = AuthState.unauthenticated();
//   } catch (e) {
//     state = AuthState.error(e.toString());
//   }
// }
//
// Future<void> sendPasswordResetEmail(String email) async {
//   state = AuthState.loading();
//   try {
//     await _repository.sendPasswordResetEmail(email);
//     state = AuthState.unauthenticated();
//   } catch (e) {
//     state = AuthState.error(e.toString());
//   }
// }


}