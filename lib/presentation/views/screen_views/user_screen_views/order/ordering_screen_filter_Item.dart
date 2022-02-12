import 'package:flutter/material.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class OrderingScreenFilterItem extends  StatefulWidget {
  final String text;
  const OrderingScreenFilterItem({Key? key, required this.text}) : super(key: key);

  @override
  State<OrderingScreenFilterItem> createState() => _OrderingScreenFilterItemState();
}

class _OrderingScreenFilterItemState extends State<OrderingScreenFilterItem> {

  late bool isChecked;

  @override
  void initState() {
    isChecked = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(scale: 1.25,
          child: Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith((states)=>getColor(states, darkBlue)),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
        ),
        const SizedBox(width: 16,),
        DefaultText(text:widget.text ,textStyle: Theme.of(context).textTheme.bodyText1,color: Colors.black,)
      ],
    );
  }
}
