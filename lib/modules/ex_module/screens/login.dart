import 'package:block_login/modules/ex_module/bloc/login_bloc.dart';
import 'package:block_login/modules/ex_module/bloc/login_event.dart';
import 'package:block_login/modules/ex_module/bloc/login_state.dart';
import 'package:block_login/screens/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordComtroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-mail Sign In With Bloc'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: ListView(
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginErrorState) {
                  return Text(state.errorMessage, style: TextStyle(
                        color: Colors.red),);
                  }
                  else {
                    return Container();

                  }
                },
              ),
              SizedBox(height: 10,),
              TextField(
                controller: emailController,
                onChanged: (val) {
                  BlocProvider.of<LoginBloc>(context).add(
                      LoginTextChangedEvent(emailController.text, passwordComtroller.text));
                },
                decoration: InputDecoration(
                  hintText: "Email Address"
                ),
                ),
          SizedBox(height: 10,),
          TextField(
            controller: passwordComtroller,
            onChanged: (val) {
              BlocProvider.of<LoginBloc>(context).add(
                  LoginTextChangedEvent(emailController.text, passwordComtroller.text));
            },
            decoration: InputDecoration(
                hintText: "Password"
            ),
          ),
          SizedBox(height: 10,),

              BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {

                    if(state is LoginLoadingState){
                      return
                          Center(child: CircularProgressIndicator());
                          }


              return CupertinoButton(
                   onPressed: (){
                           if (state is LoginValideState){
                           BlocProvider.of<LoginBloc>(context).add(
                           LoginSubmittedEvent(emailController.text, passwordComtroller.text));
                           Navigator.of(context).push(
                               MaterialPageRoute(builder: (context) =>
                                   HomeScreen()));
                     }
                   },
                   color: (state is LoginValideState) ? Colors.blue : Colors.grey,
                   child: Text('Log In'),
                  );
            }
          ),
            ],
          ),
        ),
      ),
    );
  }
}
