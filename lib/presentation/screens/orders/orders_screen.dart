import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: defaultYellow,
        leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
            ),
            onTap: () {
              Navigator.pop(context);
            }),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            DefaultText(
              text: 'طلباتك',
              textStyle: TextStyle(),
            ),
          ],
        ),
      ),
      body: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              height: size.height * 0.2,
              width: size.width * 0.4,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/image/meal.png',
                      ),
                      fit: BoxFit.fill)),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: size.height * 0.17,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultText(
                          text: "اسم المنتج",
                          textStyle: Theme.of(context).textTheme.headline6,
                          // textStyle: TextStyle(),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(
                              Icons.delete_outline,
                              color: backGroundWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const DefaultText(
                      text: "\$2121",
                      textStyle: TextStyle(),
                      color: defaultYellow,
                    ),
                    const DefaultText(
                      text:
                          "تطبيق للربط بين الاسر المنتجه ومساعدتهم على توفير بيئه",
                      // textStyle: theme.of(context).textTheme.headline6,
                      textStyle: TextStyle(), maxLines: 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
