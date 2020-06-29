import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:retro_saving_world/splash/screen.dart';

import 'app_slider/screen.dart';
import 'common/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retro',
      theme: ThemeSelection.getLightTheme(ThemeSelection.BigSpace),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
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
    );
  }
}

// void main() => runApp(new MyApp());

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey _globalKey = new GlobalKey();

  bool inside = false;
  Uint8List imageInMemory;

  Future<Uint8List> _capturePng() async {
    try {
      inside = true;
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      //      String bs64 = base64Encode(pngBytes);
      //      print(pngBytes);
      //      print(bs64);
//      setState(() {
      imageInMemory = pngBytes;
      inside = false;
//      });
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: MemoryImage(pngBytes))),
                ),
                title: Text('Hello'),
              ));
      return pngBytes;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) {
      _capturePng();
    });
    return RepaintBoundary(
        key: _globalKey, child: Scaffold(body: AppSliderScreen()));
  }
}
