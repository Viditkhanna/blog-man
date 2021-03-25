import 'package:flutter/material.dart';
import 'package:homeward/resources/strings.dart';
import 'package:regexpattern/regexpattern.dart';

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final emailCtrl = TextEditingController();
  final pwdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.login),
      ),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: TextFormField(
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value.isEmail() ? null : Strings.invalidEmailAlert,
                decoration: InputDecoration(labelText: Strings.email),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: TextFormField(
                controller: pwdCtrl,
                validator: (value) =>
                    value.length > 5 ? null : Strings.invalidPasswordAlert,
                obscureText: true,
                decoration: InputDecoration(labelText: Strings.password),
              ),
            ),
            RaisedButton(
              onPressed: () {
                if (!formKey.currentState.validate()) return;
              },
              child: Text(Strings.login),
            )
          ],
        ),
      ),
    );
  }
}
