import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class ProfileBottomSheetItem extends StatelessWidget {
  final String userType;
  final bool isActive;

  const ProfileBottomSheetItem(
      {Key? key, required this.userType, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/image/user_photo.png')),
              const SizedBox(width: 8,),
              DefaultText(
                text: 'حسام سعيد محمد',
                textStyle: Theme.of(context).textTheme.bodyText2,
                color: Colors.white,
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsetsDirectional.only(end: 4),
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: isActive ? defaultYellow : Colors.grey),
              ),
              DefaultText(
                text: userType,
                textStyle: Theme.of(context).textTheme.bodyText2,
                color: isActive ? Colors.white : Colors.grey,
              ),
            ],
          ),
          if (isActive)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(const Radius.circular(16)),
                  border: Border.all(width: 1, color: defaultYellow)),
              child: DefaultText(
                text: 'مستخدم حاليا',
                textStyle: Theme.of(context).textTheme.caption,
                color: Colors.white,
              ),
            )
        ],
      ),
    );
  }
}
