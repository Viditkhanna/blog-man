import 'package:flutter/material.dart';
import 'package:homeward/data/shared_prefs.dart';
import 'package:homeward/repo/auth_repo.dart';
import 'package:homeward/resources/strings.dart';
import 'package:homeward/ui/blog/blog_list.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final emailCtrl = TextEditingController();
  final pwdCtrl = TextEditingController();
  final loginBtnCtrl = RoundedLoadingButtonController();

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
            SizedBox(height: 12),
            FractionallySizedBox(
              widthFactor: 0.4,
              child: RoundedLoadingButton(
                controller: loginBtnCtrl,
                onPressed: () {
                  if (!formKey.currentState.validate()) {
                    loginBtnCtrl.stop();
                    return;
                  }
                  _login(context);
                },
                child: Text(Strings.login),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _login(BuildContext context) async {
    try {
      var response = await AuthRepo.login(emailCtrl.text, pwdCtrl.text);
      await Prefs.setToken(response['token']);
      BlogList.open(context);
      return;
    } catch (e) {
      _showErrorDialog(context, e);
    }
    loginBtnCtrl.stop();
  }

  void _showErrorDialog(BuildContext context, dynamic err) {
    showDialog(
        context: context,
        builder: (_context) {
          return AlertDialog(
            title: Text(Strings.error),
            content: Text('$err'),
            actions: [
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text(Strings.ok),
              ),
            ],
          );
        });
  }
}
