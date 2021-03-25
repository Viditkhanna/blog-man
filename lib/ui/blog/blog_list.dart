import 'package:flutter/material.dart';
import 'package:homeward/repo/blog_repo.dart';
import 'package:homeward/resources/strings.dart';

class BlogList extends StatefulWidget {
  static open(context) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BlogList()),
      );

  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  Future future;

  @override
  void initState() {
    super.initState();
    // future = BlogRepo.getBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.blogs),
      ),
      body: FutureBuilder(
        future: future,
        builder: (context, snap) {
          return Text('');
        },
      ),
    );
  }
}
