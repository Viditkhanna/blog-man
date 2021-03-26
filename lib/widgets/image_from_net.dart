import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageFromNet extends StatelessWidget {
  final String imageUrl;
  final height;
  final width;

  const ImageFromNet({
    Key key,
    @required this.imageUrl,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      errorWidget: (context, error, stackTrace) {
        return Icon(Icons.error);
      },
      placeholder: (context, url) {
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
