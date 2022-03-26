import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

ImageProvider defaultCachedNetworkImageProvider(
    {required String imageUrl, int? maxHeight, int? maxWidth}) {
  return CachedNetworkImageProvider(imageUrl,
      maxHeight: maxHeight, maxWidth: maxWidth,);
}
