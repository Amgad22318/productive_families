import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10,),
        decoration: BoxDecoration(
            border: Border.all(color: greyText),
          borderRadius: BorderRadius.circular(25)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(29),
          child: Material(
            child: Container(
              height: 200,
              width: double.infinity,
              child: TextFormField(
                expands: true,
                maxLines: null,
                minLines: null,
                onChanged: onChanged,
                cursorColor: defaultYellow,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ));
  }
}