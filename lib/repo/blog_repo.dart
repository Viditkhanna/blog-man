import 'package:homeward/models/blog.dart';
import 'package:homeward/network/api_client.dart';
import 'package:homeward/network/api_endpoints.dart';

class BlogRepo {
  static Future<List<Blog>> getBlogs() async {
    var response = await apiClient.get(Api.blogs) as List;
    return response.map((e) => Blog.fromMap(e)).toList();
  }
}
