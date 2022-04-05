import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:productive_families/presentation/widgets/DefaultSvg.dart';

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
        return Center(child: CircularProgressIndicator(value:downloadProgress.downloaded.toDouble() ,));
      },
      errorWidget: (context, url, error) => const Padding(
        padding: EdgeInsets.all(16),
        child: DefaultSvg(imagePath: 'assets/icons/default_photo.svg'),
      ),
    );
  }
}
