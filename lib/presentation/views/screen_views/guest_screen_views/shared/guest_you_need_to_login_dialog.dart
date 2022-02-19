import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class GuestYouNeedToLoginDialog extends StatelessWidget {
  GuestYouNeedToLoginDialog({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: const EdgeInsets.all(8),
        title: DefaultText(
          text: 'يجب تسجيل الدخول اولا لتستمتع بهذه الميزة',
          textStyle: Theme.of(context).textTheme.bodyText1,
          maxLines: 3,
          textAlign: TextAlign.center,
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
          child: DefaultMaterialButton(
            onPressed: () {Navigator.pushNamed(context, LOGIN_SCREEN);},
            text: 'تسجيل الدخول',
          ),
        ));
  }
}
