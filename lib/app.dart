import 'package:flutter/material.dart';
import 'package:homeward/data/shared_prefs.dart';
import 'package:homeward/ui/auth/login.dart';
import 'package:homeward/ui/blog/blog_list.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: FutureBuilder(
          future: Prefs.getToken(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting)
              return Container();
            if (snap.hasData) return BlogList();
            return LoginPage();
          }),
    );
  }
}
