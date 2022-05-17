import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:productive_families/business_logic/global_cubit/global_cubit.dart';
import 'package:productive_families/presentation/router/app_router.dart';
import 'package:productive_families/presentation/styles/themes.dart';
import 'package:sizer/sizer.dart';

import 'business_logic/user/favorite_state/user_favorite_state_cubit.dart';
import 'data/data_provider/local/cache_helper.dart';
import 'data/data_provider/remote/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  runApp(DevicePreview(
      enabled: false,
      isToolbarVisible: true,
      builder: (context) => MyApp(
            appRouter: AppRouter(),
          )));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GlobalCubit(),
          ),
          BlocProvider(
            create: (context) => UserFavoriteStateCubit(),
          ),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              useInheritedMediaQuery: true,
              localizationsDelegates: const [
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [Locale("en", ""), Locale("ar", "")],
              locale: const Locale("ar", ""),
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              themeMode: ThemeMode.light,
              onGenerateRoute: appRouter.onGenerateRoute,
            );
          },
        ));
  }
}
