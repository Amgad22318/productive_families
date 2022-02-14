import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';

class MarketOwnerEditImagePickerItem extends StatelessWidget {
  const MarketOwnerEditImagePickerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: greyText.withOpacity(0.3),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.12,
                  child: const Image(
                    image: AssetImage(
                      'assets/image/make_up.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: size.height * 0.12,
                  child: Center(
                    child: Icon(Icons.add,color: greyText,size: 35,),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.24,
            width: 1,
            color: greyText.withOpacity(0.3),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.12,
                  child: const Image(
                    image: AssetImage(
                      'assets/image/make_up.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: size.height * 0.12,
                  child: Center(
                    child: Icon(Icons.add,color: greyText,size: 35,),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.24,
            width: 1,
            color: greyText.withOpacity(0.3),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.12,
                  child: const Image(
                    image: AssetImage(
                      'assets/image/make_up.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: size.height * 0.12,
                  child: Center(
                    child: Icon(Icons.add,color: greyText,size: 35,),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
