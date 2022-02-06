import 'package:flutter/material.dart';

class DefaultSplitterBuilder extends StatelessWidget {
  const DefaultSplitterBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0,
      width: double.infinity,
    );
  }
}
