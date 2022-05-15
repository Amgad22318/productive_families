import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';



class ImagePickerBottomSheet extends StatelessWidget {
  final void Function()? cameraOnTap;
  final void Function()? galleryOnTap;
  const ImagePickerBottomSheet({Key? key,required this.cameraOnTap,required this.galleryOnTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0))),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsetsDirectional.only(top: 8),
      child: Wrap(children: <Widget>[
        ListTile(
          leading: const Icon(Icons.camera_alt,color: Colors.white,),
          title: const Text('Camera',style: TextStyle(color: Colors.white,)),
          onTap:cameraOnTap
        ),
        ListTile(
          leading: const Icon(Icons.photo_outlined,color: Colors.white,),
          title: const Text('Gallery',style: TextStyle(color: Colors.white,)),
          onTap:galleryOnTap
        ),
      ]),
    );
  }
}
