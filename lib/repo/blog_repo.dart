import 'package:homeward/network/api_client.dart';
import 'package:homeward/network/api_endpoints.dart';

class BlogRepo {
  static Future getBlogs() async {
    var response = await apiClient.get(Api.blogs);
    return response;
  }
}
