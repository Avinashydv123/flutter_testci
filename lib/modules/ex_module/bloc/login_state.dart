
abstract class LoginState {}

class LoginInitialState extends LoginState{}

class LoginInvalidState extends LoginState{}

class LoginValideState extends LoginState{}

class LoginErrorState extends LoginState{
  String errorMessage;
  LoginErrorState(this.errorMessage);
}

class LoginLoadingState extends LoginState{}