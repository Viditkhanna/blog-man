import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageFromNet extends StatelessWidget {
  final String imageUrl;

  const ImageFromNet({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      errorWidget: (context, error, stackTrace) {
        return Icon(Icons.error);
      },
      placeholder: (context, url) {
        return CircularProgressIndicator();
      },
    );
  }
}
