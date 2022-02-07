import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/chat_bubel.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class CustomerServicesChatScreen extends StatefulWidget {
  CustomerServicesChatScreen({Key? key}) : super(key: key);

  @override
  State<CustomerServicesChatScreen> createState() =>
      _CustomerServicesChatScreenState();
}

class _CustomerServicesChatScreenState
    extends State<CustomerServicesChatScreen> {
  bool iconButtonShown = true;
  TextEditingController chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        height: 80,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset('assets/icons/back_arrow.svg'))
        ],
        title: const DefaultText(
          text: 'تواصل مع خدمة العملاء',
          textStyle: TextStyle(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ChatBuble(),
                  const ChatBubleForFriend(
                    color: Color(0xFF3698D9),
                  ),
                  DefaultText(
                    text: 'الأن',
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                  const ChatBuble(),
                  const ChatBubleForFriend(
                    color: Color(0xFF3698D9),
                  ),
                  const ChatBuble(),
                  const ChatBubleForFriend(
                    color: Color(0xFF3698D9),
                  ),
                  const ChatBuble(),
                  const ChatBubleForFriend(
                    color: Color(0xFF3698D9),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                top: 2, start: 20, end: 20, bottom: 10),
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 10,
              shadowColor: Colors.black,
              child: Row(
                children: [
                  Visibility(
                    visible: iconButtonShown,
                    child: DefaultIconButton(
                        onPressed: () {},
                        background: Colors.transparent,
                        icon: SvgPicture.asset(
                          "assets/icons/sendIcon.svg",
                          color: const Color(0xFF4FBC87),
                        )),
                  ),
                  Visibility(
                    visible: iconButtonShown,
                    child: DefaultIconButton(
                      onPressed: () {},
                      background: Colors.transparent,
                      icon: SvgPicture.asset(
                        "assets/icons/mic.svg",
                        color: const Color(0xFFD3D4D6),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: DefaultFormField(
                        containerAlignment: AlignmentDirectional.centerStart,
                          textColor: darkBlue,
                          hintText: 'Type a Message',
                          backgroundColor: Colors.transparent,
                          onFieldSubmitted: (p0) {
                            setState(() {
                              iconButtonShown = true;
                            });
                          },
                          onTap: () {
                            setState(() {
                              iconButtonShown = false;
                            });
                          },
                          controller: chatController,
                          validator: (p0) {},
                          keyboardType: TextInputType.text),
                    ),
                  ),
                  Visibility(
                    visible: iconButtonShown,
                    child: DefaultIconButton(
                        onPressed: () {},
                        background: Colors.transparent,
                        icon: SvgPicture.asset(
                          "assets/icons/pin.svg",
                          color: const Color(0xFFD3D4D6),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Positioned(
// child: Padding(
// padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
// child: Material(
// elevation: 15,
// shadowColor: Colors.black,
// borderRadius: BorderRadius.circular(25),
// child: TextFormField(
// controller: chatController,
// textDirection: TextDirection.rtl,
// decoration: InputDecoration(
// icon: Row(
// children: [
// const SizedBox(
// width: 40,
// ),
// SvgPicture.asset(
// "assets/icons/sendIcon.svg",
// color: const Color(0xFF4FBC87),
// ),
// const SizedBox(
// width: 25,
// ),
// SvgPicture.asset(
// "assets/icons/mic.svg",
// color: const Color(0xFFD3D4D6),
// ),
// const Expanded(
// child: Text(
// '                     | Type a Message',
// style: TextStyle(
// color: Color(0xFFD3D4D6),
// ),
// ),
// ),
// SvgPicture.asset(
// "assets/icons/pin.svg",
// color: const Color(0xFFD3D4D6),
// ),
// ],
// )),
// ),
// ),
// ),
// ),
