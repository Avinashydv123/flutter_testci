

import 'package:block_login/modules/ex_module/bloc/login_event.dart';
import 'package:block_login/modules/ex_module/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';



class LoginBloc extends Bloc<LoginEvent,LoginState>{

  LoginBloc() : super(LoginInitialState()){
    on<LoginTextChangedEvent>((event, emit) {

      if(EmailValidator.validate(event.emailValue)== false)  {
        emit(LoginErrorState("Please Enter a valid Email address")
        );
      }
      else if (event.passwordValue.length<8) {
        emit(LoginErrorState("Please Enter a valid password"));
      }
      else {
        emit(LoginValideState());
      }
    });


    on<LoginSubmittedEvent>((event, emit) {

    emit(LoginLoadingState());
    });
  }
}