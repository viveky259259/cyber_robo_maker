import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:retro_saving_world/splash/screen.dart';

import 'bloc/login/bloc.dart';
import 'bloc/overlays/bloc.dart';
import 'common/themes.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<OverLayBloc>(
          create: (context) => OverLayBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Retro',
        theme: ThemeSelection.getLightTheme(ThemeSelection.OutRunner),
        home: SplashScreen(),
        navigatorKey: Get.key,
        builder: (context, child) {
          return ResponsiveWrapper(
              shrinkWrap: true,
              maxWidth: 500,
              mediaQueryData: MediaQuery.of(context),
              minWidth: 400,
              breakpoints: [],
              child: child);
        },
      ),
    );
  }
}
