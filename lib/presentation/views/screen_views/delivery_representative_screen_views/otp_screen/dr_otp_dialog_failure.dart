import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
class DROTPDialogFailure extends StatelessWidget {
  const DROTPDialogFailure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      contentPadding: const EdgeInsets.all(40),
      title: const Center(
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
            child: Icon(
              Icons.clear,
              color: backGroundWhite,
              size: 40,
            ),
          )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Text(
            '! التحقق',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            'لم يتم التحقق بنجاح',
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: DefaultMaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'إبدأ',
          ),
        ),
      ],
    );
  }
}
