import 'package:flutter/material.dart';
import 'package:homeward/utils/error_handling.dart';

class CustomErrorWidget extends StatelessWidget {
  final dynamic error;

  const CustomErrorWidget(this.error);

  @override
  Widget build(BuildContext context) {
    return Text('${ErrorHandling.parseError(context, error)}');
  }
}
