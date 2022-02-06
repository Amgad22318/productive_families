import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/views/chat_bubel.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class SellerChatScreen extends StatelessWidget {
  SellerChatScreen({Key? key}) : super(key: key);
  TextEditingController sellerChatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,
        actions: [
          GestureDetector(
              child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SvgPicture.asset('assets/icons/back_arrow.svg')),
              onTap: () {
                Navigator.pop(context);
              })
        ],
        title: const DefaultText(
          text: 'تواصل مع المتجر',
          textStyle: TextStyle(),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ChatBuble(),
                      const ChatBubleForFriend(
                          color: Color(0xFF30B893),
                      ),
                      DefaultText(
                        text: 'الأن',
                        textStyle: Theme.of(context).textTheme.headline6,
                      ),
                      const ChatBuble(),
                      const ChatBubleForFriend(
                        color: Color(0xFF30B893),
                      ),
                      const ChatBuble(),
                      const ChatBubleForFriend(
                        color: Color(0xFF30B893),
                      ),
                      const ChatBuble(),
                      const ChatBubleForFriend(
                        color: Color(0xFF30B893),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Material(
                elevation: 15,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.circular(25),
                child: TextFormField(
                  controller: sellerChatController,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                      icon: Row(
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          GestureDetector(
                            onTap: (){},
                            child: SvgPicture.asset(
                              "assets/icons/sendIcon.svg",
                              color: const Color(0xFF4FBC87),
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          SvgPicture.asset(
                            "assets/icons/mic.svg",
                            color: const Color(0xFFD3D4D6),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){},
                              child: const Text(
                                '                     | Type a Message',
                                style: TextStyle(
                                  color: Color(0xFFD3D4D6),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){},
                            child: SvgPicture.asset(
                              "assets/icons/pin.svg",
                              color: const Color(0xFFD3D4D6),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
