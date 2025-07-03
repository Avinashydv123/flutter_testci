
abstract class LoginEvent{}

class LoginTextChangedEvent extends LoginEvent{
  String emailValue;
  String passwordValue;
  LoginTextChangedEvent(this.emailValue,this.passwordValue);
}

class LoginSubmittedEvent extends LoginEvent{
  String email;
  String password;
  LoginSubmittedEvent(this.email,this.password);
}