import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'auth_repository_interface.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  User user;

  @action
  setUser(User value) {
    user = value;
    status = user == null ? AuthStatus.logOut : AuthStatus.login;
  }

  _AuthControllerBase() {
    _authRepository.getUser().then(setUser).catchError((e) {
      print("ERROR");
    });
  }

  Future loginWithGoogle() async {
    user = await _authRepository.getGoogleLogin();
  }

  Future logOut() {
    return _authRepository.getLogout();
  }
}

enum AuthStatus { loading, login, logOut }
