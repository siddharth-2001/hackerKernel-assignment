import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../widgets/auth_form.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: Theme.of(context).primaryColor,
              child: Center(
                  child: Text(
                "LOGIN",
                style: TextStyle(color: Colors.white, fontSize: 24),
              )),
            ),
          ),
          AuthForm(),
        ],
      ),
    ));
  }
}
