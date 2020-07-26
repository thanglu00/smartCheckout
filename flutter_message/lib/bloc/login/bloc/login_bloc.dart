import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
//import 'package:rxdart/rxdart.dart';
import 'package:fluttermessage/bloc/login/login.dart';
import 'package:fluttermessage/repository/user_repository.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;

  LoginBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  LoginState get initialState => LoginState.initial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithGooglePressed) {
      yield* _mapLoginWithGooglePressedToState();
    }
    if(event is LoginWithFacebookPressed){
      yield* _mapLoginWithFacebookPressedToState();
    }
  }

  Stream<LoginState> _mapLoginWithGooglePressedToState() async* {
    try {
      await _userRepository.signInWithGoogle();
      _userRepository.checkAccountExist();
      print("Đăng nhập");
      yield LoginState.success();
      print("Đăng nhập thanh cong");
    } catch (_) {
      yield LoginState.failure();
      print("Loi!!!!");
    }
  }
  Stream<LoginState> _mapLoginWithFacebookPressedToState() async* {
    try {
      await _userRepository.signInWithFaceBook();
      _userRepository.checkAccountExist();
      print("Đăng nhập");
      yield LoginState.success();
      print("Đăng nhập thanh cong");
    } catch (_) {
      yield LoginState.failure();
      print("Loi!!!!");
    }
  }


}
