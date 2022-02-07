import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class ChatBuble extends StatelessWidget {
const ChatBuble({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              DefaultText(
                text: '01:05 PM',
                textStyle: Theme.of(context).textTheme.caption,
                color: const Color(0xFF77838F),
              )
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding:
                    const EdgeInsets.only(left: 16, top: 15, bottom: 15, right: 32),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: const BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                  ),
                  color: const Color(0xFFD8D8D8),
                ),
                child: const Text(
                  "is simply dummy text of the printing and typesvettinga text of the printing and typesvettinga     text of the printing and typesvettinga     text of the printing and typesvettinga          s as a fsa fsa fas fs fsa fsf af sa fas fsa fsa fsa fas fsaf13 2f112124 saf fsa fsa fas21421421412 421412 42 14 21412  industry",

                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFFD8D8D8),
              )
            ],
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}

class ChatBubleForFriend extends StatelessWidget {
  final Color color;

  const ChatBubleForFriend({
    Key? key,required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Align(

              alignment: Alignment.centerRight,
              child: Container(
                padding:
                const EdgeInsets.only(left: 32, top: 15, bottom: 15, right: 32),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: const Radius.circular(18),
                    topLeft: const Radius.circular(18),
                    bottomLeft: const Radius.circular(18),
                  ),
                  color: color,
                ),
                child: const Text(
                  "is simply dumm 214214 2142 1 421 421 421 421 4 12saf say",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              DefaultText(
                text: '01:05 PM',
                textStyle: Theme.of(context).textTheme.caption,
                color: Colors.grey,
              )
            ],
          ),
        ],
      ),
    );
  }
}
