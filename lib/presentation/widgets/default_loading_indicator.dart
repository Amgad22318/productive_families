import 'package:flutter/material.dart';

class DefaultLoadingIndicator extends StatelessWidget {
  const DefaultLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
