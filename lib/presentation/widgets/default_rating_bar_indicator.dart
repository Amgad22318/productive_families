import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DefaultRatingBarIndicator extends StatelessWidget {
  final double rating;
  final int itemCount;
  final double itemSize;
  final EdgeInsets? itemPadding;

  const DefaultRatingBarIndicator(
      {Key? key,
      required this.rating,
      required this.itemCount,
      required this.itemSize,
      this.itemPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemPadding: itemPadding ??EdgeInsets.zero,
      rating: rating,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: itemCount,
      itemSize: itemSize,
      direction: Axis.horizontal,
    );
  }
}
