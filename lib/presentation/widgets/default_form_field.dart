import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final String? labelText;
  final TextInputType keyboardType;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final void Function()? suffixIconOnPressed;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? initialValue;
  final Color? suffixIconColor;

  const DefaultFormField(
      {Key? key,
      required this.controller,
      required this.validator,
      this.onTap,
      this.labelText,
      required this.keyboardType,
      this.onFieldSubmitted,
      this.onEditingComplete,
      this.onChanged,
      this.obscureText = false,
      this.suffixIconOnPressed,
      this.prefixIcon,
      this.suffixIcon,
      this.initialValue,
      this.suffixIconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
          color: formFieldBackGround,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: TextFormField(
        textDirection: TextDirection.rtl,
        initialValue: initialValue,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        onTap: onTap,
        obscureText: obscureText,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: 'أكتب هنا..',
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          hintTextDirection: TextDirection.rtl,
          prefixIcon: Icon(
            prefixIcon,
          ),
          suffixIcon: IconButton(
            onPressed: suffixIconOnPressed,
            icon: Icon(
              suffixIcon,
              color: suffixIconColor,
            ),
          ),
        ),
      ),
    );
  }
}
