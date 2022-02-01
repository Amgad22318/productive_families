import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';

class DefaultShopAppbar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? title;
  final bool centerTitle;
  final double? height;

  DefaultShopAppbar({Key? key, this.actions, this.leading, this.title, this.centerTitle=false,  this.height}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Color(0xFFFFDC2A),
              Color(0xFFFFF2B3),
            ],
          ),
        ),
      ),
      actions: actions,
      leading: leading,
      title: title,
      backgroundColor: defaultYellow,
    );
  }
}
