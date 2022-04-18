import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultErrorWidget extends StatelessWidget {
  const DefaultErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(child: Icon(Icons.error_outline,color: Colors.red,size: 48.sp,));
  }
}
