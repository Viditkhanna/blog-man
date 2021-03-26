import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homeward/data/shared_prefs.dart';
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
              return 'Token Expired';
            } else if (error.response.statusCode == 404) {
              return 'Page Not Found';
            }
            return error.message;
          case DioErrorType.DEFAULT:
            return 'Unable to connect to network!';
          default:
            return error.message;
        }
      }
    } catch (e) {
      return 'Unknown error!';
    }
    return error?.toString() ?? 'Unknown error!';
  }

  static void _showTokenExpiredDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () {},
          child: AlertDialog(
            content: Text('Your token has expired. Please login again.'),
            actions: <Widget>[
              FlatButton(
                onPressed: () async {
                  await Prefs.clearPrefs();
                  LoginPage.openAndRemoveUntil(context);
                },
                child: Text(
                  'OK',
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
