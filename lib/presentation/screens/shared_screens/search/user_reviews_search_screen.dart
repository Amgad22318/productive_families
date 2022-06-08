import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_search_bar.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class UserReviewsSearchScreen extends StatefulWidget {
  const UserReviewsSearchScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<UserReviewsSearchScreen> createState() =>
      _UserReviewsSearchScreenState();
}

class _UserReviewsSearchScreenState extends State<UserReviewsSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,
        title: DefaultText(
          textStyle: Theme.of(context).textTheme.headline5,
          text: 'بحث التقييمات',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset('assets/icons/back_arrow.svg'))
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/image/appbar_half_circle.png',
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: DefaultSearchBar(
                hintText: 'إبحث عن تقييم معين..',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                textColor: darkBlue,
                backgroundColor: orderFollowUpGreyCheck,
                controller: _searchController,
                keyboardType: TextInputType.text),
          ),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //     child: SingleChildScrollView(
          //       child: StaggeredGrid.count(
          //         crossAxisCount: 2,
          //         crossAxisSpacing: 6,
          //         mainAxisSpacing: 6,
          //         children: List.generate(
          //             13,
          //             (index) =>  const StaggeredGridTile.fit(
          //                 crossAxisCellCount: 1,
          //                 child: ReviewSearchGridItem())),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
