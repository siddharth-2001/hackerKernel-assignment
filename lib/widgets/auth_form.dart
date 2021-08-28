import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  Map<String, String> _authData = {'email': '', 'password': ''};
  GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;

  void _submitData() {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isLoading = true;
    });
    _formKey.currentState!.save();
    Provider.of<Auth>(context, listen: false)
        .login(_authData['email']!, _authData['password']!)
        .then((value) {
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pushReplacementNamed('/karmaDrives');
    }).catchError((error) {
      //In case of error display the custom error message in a snackbar
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    });
  }

  Widget formField(String name, bool isPass) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(235, 235, 235, 1),
          borderRadius: const BorderRadius.all(const Radius.circular(8))),
      child: TextFormField(
        obscureText: isPass,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            focusColor: Theme.of(context).primaryColor,
            border: InputBorder.none,
            hintText: name,
            hintStyle: TextStyle(fontWeight: FontWeight.w500),
            contentPadding: EdgeInsets.symmetric(horizontal: 32)),
        onSaved: (value) {
          _authData[name] = value!;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  formField('email', false),
                  SizedBox(
                    height: 40,
                  ),
                  formField('password', true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: Theme.of(context).primaryColorDark),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _submitData();
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(128, 32),
                        primary: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(8)))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member yet?'),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Click Here',
                            style: TextStyle(
                                color: Theme.of(context).primaryColorDark),
                          ))
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
