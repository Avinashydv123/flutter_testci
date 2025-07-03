import 'package:block_login/modules/ex_module/bloc/login_bloc.dart';
import 'package:block_login/modules/ex_module/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      backgroundColor: Colors.grey,
      body:Center(
        child: ElevatedButton(
          onPressed: () async{
              print('Signed Out');
              await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>
                      LoginScreen()));
            },

          child: Text('logout'),
        ),
      ),
    );
  }
}

