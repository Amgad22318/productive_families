import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/business_logic/shared/all_app_setting/all_app_setting_cubit.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  TermsAndConditionsScreen({Key? key}) : super(key: key);
  AllAppSettingCubit? cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllAppSettingCubit()..getTerms(),
      child: Scaffold(
        appBar: DefaultShopAppbar(
          centerTitle: true,
          title: DefaultText(
            textStyle: Theme.of(context).textTheme.headline5,
            text: 'البنود و الشروط',
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
            )
          ],
        ),
        body: Column(
          children: [
            Image.asset(
              'assets/image/appbar_half_circle.png',
            ),
            BlocBuilder<AllAppSettingCubit, AllAppSettingStates>(
              builder: (context, state) {
                cubit = AllAppSettingCubit.get(context);
                return ConditionalBuilder(
                  condition: cubit!.terms != null,
                  fallback: (context) =>
                  const Expanded(child: Center(child: CircularProgressIndicator())),
                  builder: (context) => Expanded(
                    child: Scrollbar(
                      scrollbarOrientation: ScrollbarOrientation.right,
                      showTrackOnHover: true,
                      isAlwaysShown: true,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 16, end: 16),
                        child: SingleChildScrollView(
                            child: Text(
                              cubit!.terms!.appSettings!.terms.toString(),
                              style: Theme.of(context).textTheme.caption,
                            )),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
