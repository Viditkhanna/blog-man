import 'package:flutter/material.dart';
import 'package:homeward/models/blog_details.dart';
import 'package:homeward/repo/blog_repo.dart';
import 'package:homeward/widgets/custom_error_widget.dart';
import 'package:homeward/widgets/image_from_net.dart';
import 'package:intl/intl.dart';

class BlogDetailsScreen extends StatelessWidget {
  final String id;

  BlogDetailsScreen({Key key, this.id}) : super(key: key);

  static open(context, String id) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BlogDetailsScreen(id: id)),
      );

  final dateFormat = DateFormat('MMM-dd-yyyy');

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Details'),
      ),
      body: FutureBuilder<BlogDetails>(
          future: BlogRepo.getBlogDetails(id),
          builder: (context, snap) {
            if (snap.hasError)
              return Center(
                child: CustomErrorWidget(snap.error),
              );
            if (!snap.hasData)
              return Center(child: CircularProgressIndicator());

            final blog = snap.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ImageFromNet(
                    imageUrl: blog.imageUrl,
                    height: screenSize.height / 3,
                  ),
                ),
                SizedBox(height: 12),
                Center(
                  child: Text(
                    '${blog.title}',
                    style: textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 8),
                Center(child: Text('${dateFormat.format(blog.createdAt)}'))
              ],
            );
          }),
    );
  }
}
