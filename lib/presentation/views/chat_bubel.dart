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
                  "is simply dummy text of the printing and typesetting industry",
                  maxLines: 6,

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
                  "is simply dummy",
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
