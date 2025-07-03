
import 'package:block_login/modules/ex_module/bloc/login_bloc.dart';
import 'package:block_login/modules/ex_module/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(),
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}