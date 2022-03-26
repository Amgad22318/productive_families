import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DefaultCachedNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageUrl;
  final BoxFit? fit;

  const DefaultCachedNetworkImage(
      {Key? key,
      this.height,
      required this.imageUrl,
      this.width = double.infinity,
      required this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit:fit,
      width: width,
      height: height,
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Image.asset(

          "assets/image/loading.gif",
          width: width,
          height: height,
          fit:fit,
        );
      },
      errorWidget: (context, url, error) => Padding(
        padding: const EdgeInsets.all(16),
        child: Image.asset('assets/image/laundry.png'),
      ),
    );
  }
}
