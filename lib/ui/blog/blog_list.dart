import 'package:flutter/material.dart';
import 'package:homeward/models/blog.dart';
import 'package:homeward/repo/blog_repo.dart';
import 'package:homeward/resources/strings.dart';
import 'package:intl/intl.dart';

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
  final dateFormat = DateFormat('MMM-dd-yyyy');

  @override
  void initState() {
    super.initState();
    future = BlogRepo.getBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.blogs),
      ),
      body: FutureBuilder<List<Blog>>(
        future: future,
        builder: (context, snap) {
          if (!snap.hasData) return Center(child: CircularProgressIndicator());
          if (snap.hasError)
            return Center(
              child: Text("${snap.error}"),
            );
          return ListView.builder(
            itemCount: snap.data.length,
            itemBuilder: (context, i) {
              final blog = snap.data[i];
              return ListTile(
                leading: Image.network('${blog.imageUrl}'),
                title: Text('${blog.title}'),
                subtitle: Text('${dateFormat.format(blog.createdAt)}'),
              );
            },
          );
        },
      ),
    );
  }
}
