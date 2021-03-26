import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homeward/data/shared_prefs.dart';
import 'package:homeward/resources/strings.dart';
import 'package:homeward/ui/auth/login.dart';

class ErrorHandling {
  static parseError(BuildContext context, error) {
    try {
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.RESPONSE:
            if (error.response.statusCode == 400) {
              Map<String, dynamic> map = error.response.data;
              var entry = map.entries.first;
              return '${entry.key} : ${entry.value}';
            } else if (error.response.statusCode == 422) {
              return error.response.data['error'];
            } else if (error.response.statusCode == 401) {
              Future.delayed(Duration(seconds: 1))
                  .then((value) => _showTokenExpiredDialog(context));
              return Strings.tokenExpiredError;
            } else if (error.response.statusCode == 404) {
              return Strings.pageNotFoundError;
            }
            return error.message;
          case DioErrorType.DEFAULT:
            return Strings.noInternetError;
          default:
            return error.message;
        }
      }
    } catch (e) {
      return Strings.unknownError;
    }
    return error?.toString() ?? Strings.unknownError;
  }

  static void _showTokenExpiredDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: AlertDialog(
            content: Text(Strings.tokenExpiredErrorAlert),
            actions: <Widget>[
              FlatButton(
                onPressed: () async {
                  await Prefs.clearPrefs();
                  LoginPage.openAndRemoveUntil(context);
                },
                child: Text(
                  Strings.ok,
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
