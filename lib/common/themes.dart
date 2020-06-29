import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeSelection {
  static final String Routhers = 'Routhers';
  static final String ArcadeMachine = 'ArcadeMachine';
  static final String OutRunner = 'OutRunner';
  static final String RetroFunk = 'RetroFunk';
  static final String Neon = "Neon";
  static final String NeonCity = "NeonCity";
  static final String EvilEmpire = "EvilEmpire";
  static final String BigSpace = "BigSpace";
  static const Color dark = Color(0xFF383838);
  static const Color neonPurple = Color(0xFFbc13fe);
  static const Color neonDarkBlue = Color(0xFF7d12ff);
  static const Color neonNew = Color(0xFFbc13fe);
  static const Color blueNeon = Color(0xffc4ffff);
  static const Color blueNeonDark = Color(0xff08ddea);
  static const Color ascentColor = Color(0xfffd8090);
  static const Color borderColor = Color.fromRGBO(181, 86, 147, 1);
  static const bgColor = Color.fromRGBO(254, 251, 222, 1);
  static const bgColor2 = Color.fromRGBO(8, 8,109, 1);
  static ThemeData getLightTheme(String selectedFont) => ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
      primarySwatch: MaterialColor(
        0xFFF5E0C3,
        <int, Color>{
          50: Color(0x1affeaa5),
          100: Color(0xa1ffeaa5),
          200: Color(0xaaffeaa5),
          300: Color(0xafffeaa5),
          400: Color(0xffffeaa5),
          500: Color(0xffEDD5B3),
          600: Color(0xffDEC29B),
          700: Color(0xffC9A87C),
          800: Color(0xffB28E5E),
          900: Color(0xff40a798)
        },
      ),
      primaryColor: Color(0xFF7d12ff),
      primaryColorBrightness: Brightness.light,
      primaryColorLight: Color(0x1affeaa5),
      primaryColorDark: Color(0xff40a798),
      canvasColor: Color(0xffE09E45),
      accentColor: Color(0xff226b80),
      accentColorBrightness: Brightness.light,
      scaffoldBackgroundColor: bgColor2,
//    bottomAppBarColor: Color(0xff6D42CE),
      cardColor: Color(0xaaffeaa5),
      dividerColor: Color(0xff40a798),
      focusColor: Color(0x1affeaa5),
      hoverColor: Color(0xffDEC29B),
      highlightColor: Color(0xff40a798),
//    splashColor: Color(0xff226b80),
////  splashFactory: # override create method from  InteractiveInkFeatureFactory
//    selectedRowColor: Colors.grey,
//    unselectedWidgetColor: Colors.grey.shade400,
//    disabledColor: Colors.grey.shade200,
//    buttonTheme: ButtonThemeData(
//      //button themes
//    ),
//    toggleButtonsTheme: ToggleButtonsThemeData(
//      //toggle button theme
//    ),
      buttonColor: Color(0xff40a798),
//    secondaryHeaderColor: Colors.grey,
//    textSelectionColor: Color(0xffB5BFD3),
//    cursorColor: Color(0xff40a798),
//    textSelectionHandleColor: Color(0xff40a798),
//    backgroundColor: Color(0xff226b80),
//    dialogBackgroundColor: Colors.white,
//    indicatorColor: Color(0xff226b80),
//    hintColor: Colors.grey,
//    errorColor: Colors.red,
//    toggleableActiveColor: Color(0xff6D42CE),
//    textTheme: TextTheme(
//      //text themes that contrast with card and canvas
//    ),
//    primaryTextTheme: TextTheme(
//      //text theme that contrast with primary color
//    ),
//    accentTextTheme: TextTheme(
//      //text theme that contrast with accent Color
//    ),
//    inputDecorationTheme: InputDecorationTheme(
//      // default values for InputDecorator, TextField, and TextFormField
//    ),
//    iconTheme: IconThemeData(
//      //icon themes that contrast with card and canvas
//    ),
//    primaryIconTheme: IconThemeData(
//      //icon themes that contrast primary color
//    ),
//    accentIconTheme: IconThemeData(
//      //icon themes that contrast accent color
//    ),
//    sliderTheme: SliderThemeData(
//      // slider themes
//    ),
//    tabBarTheme: TabBarTheme(
//      // tab bat theme
//    ),
//    tooltipTheme: TooltipThemeData(
//      // tool tip theme
//    ),
//    cardTheme: CardTheme(
//      // card theme
//    ),
//    chipTheme: ChipThemeData(
//        backgroundColor: Color(0xff40a798),
//        disabledColor: Color(0xaaffeaa5),
//        shape: StadiumBorder(),
//        brightness: Brightness.light,
//        labelPadding: EdgeInsets.all(8),
//        labelStyle: TextStyle(),
//        padding: EdgeInsets.all(8),
//        secondaryLabelStyle: TextStyle(),
//        secondarySelectedColor: Colors.white38,
//        selectedColor: Colors.white
//      // chip theme
//    ),
//    platform: TargetPlatform.android,
//    materialTapTargetSize: MaterialTapTargetSize.padded,
//    applyElevationOverlayColor: true,
//    pageTransitionsTheme: PageTransitionsTheme(
//      //page transition theme
//    ),
      appBarTheme: AppBarTheme(
          //app bar theme
          color: ascentColor),
//    bottomAppBarTheme: BottomAppBarTheme(
//      // bottom app bar theme
//    ),
//    colorScheme: ColorScheme(
//        primary: Color(0xffEDD5B3),
//        primaryVariant: Color(0x1affeaa5),
//        secondary: Color(0xffC9A87C),
//        secondaryVariant: Color(0xaaC9A87C),
//        brightness: Brightness.light,
//        background: Color(0xffB5BFD3),
//        error: Colors.red,
//        onBackground: Color(0xffB5BFD3),
//        onError: Colors.red,
//        onPrimary: Color(0xffEDD5B3),
//        onSecondary: Color(0xffC9A87C),
//        onSurface: Color(0xff226b80),
//        surface: Color(0xff226b80)),
//    snackBarTheme: SnackBarThemeData(
//      // snack bar theme
//    ),
//    dialogTheme: DialogTheme(
//      // dialog theme
//    ),
//    floatingActionButtonTheme: FloatingActionButtonThemeData(
//      // floating action button theme
//    ),
//    navigationRailTheme: NavigationRailThemeData(
//      // navigation rail theme
//    ),
//    typography: Typography.material2018(),
//    cupertinoOverrideTheme: CupertinoThemeData(
//      //cupertino theme
//    ),
//    bottomSheetTheme: BottomSheetThemeData(
//      //bottom sheet theme
//    ),
//    popupMenuTheme: PopupMenuThemeData(
//      //pop menu theme
//    ),
//    bannerTheme: MaterialBannerThemeData(
//      // material banner theme
//    ),
//    dividerTheme: DividerThemeData(
//      //divider, vertical divider theme
//    ),
//    buttonBarTheme: ButtonBarThemeData(
//      // button bar theme
//    ),
      fontFamily: selectedFont,
      splashFactory: InkSplash.splashFactory);

  static ThemeData getDarkTheme(String selectedFont) => ThemeData(
      brightness: Brightness.dark,
      visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
      primarySwatch: MaterialColor(
        0xFFffeaa5,
        <int, Color>{
          50: Color(0x1a5D4524),
          100: Color(0xa15D4524),
          200: Color(0xaa5D4524),
          300: Color(0xaf5D4524),
          400: Color(0x1a483112),
          500: Color(0xa1483112),
          600: Color(0xaa483112),
          700: Color(0xff483112),
          800: Color(0xaf2F1E06),
          900: Color(0xff2F1E06)
        },
      ),
      primaryColor: Color(0xff5D4524),
      primaryColorBrightness: Brightness.dark,
      primaryColorLight: Color(0x1a311F06),
      primaryColorDark: Color(0xff40a798),
      canvasColor: Color(0xffE09E45),
      accentColor: Color(0xff226b80),
      accentColorBrightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xffB5BFD3),
      bottomAppBarColor: Color(0xff6D42CE),
      cardColor: Color(0xaa311F06),
      dividerColor: Color(0x1f6D42CE),
      focusColor: Color(0x1a311F06),
      hoverColor: Color(0xa15D4524),
      highlightColor: Color(0xaf2F1E06),
      splashColor: Color(0xff226b80),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
      selectedRowColor: Colors.grey,
      unselectedWidgetColor: Colors.grey.shade400,
      disabledColor: Colors.grey.shade200,
      buttonTheme: ButtonThemeData(
//button themes
          ),
      toggleButtonsTheme: ToggleButtonsThemeData(
//toggle button theme
          ),
      buttonColor: Color(0xff483112),
      secondaryHeaderColor: Colors.grey,
      textSelectionColor: Color(0x1a483112),
      cursorColor: Color(0xff483112),
      textSelectionHandleColor: Color(0xff483112),
      backgroundColor: Color(0xff226b80),
      dialogBackgroundColor: Colors.white,
      indicatorColor: Color(0xff226b80),
      hintColor: Colors.grey,
      errorColor: Colors.red,
      toggleableActiveColor: Color(0xff6D42CE),
      textTheme: TextTheme(
//text themes that contrast with card and canvas
          ),
      primaryTextTheme: TextTheme(
//text theme that contrast with primary color
          ),
      accentTextTheme: TextTheme(
//text theme that contrast with accent Color
          ),
      inputDecorationTheme: InputDecorationTheme(
// default values for InputDecorator, TextField, and TextFormField
          ),
      iconTheme: IconThemeData(
//icon themes that contrast with card and canvas
          ),
      primaryIconTheme: IconThemeData(
//icon themes that contrast primary color
          ),
      accentIconTheme: IconThemeData(
//icon themes that contrast accent color
          ),
      sliderTheme: SliderThemeData(
          // slider themes
          ),
      tabBarTheme: TabBarTheme(
          // tab bat theme
          ),
      tooltipTheme: TooltipThemeData(
          // tool tip theme
          ),
      cardTheme: CardTheme(
          // card theme
          ),
      chipTheme: ChipThemeData(
          backgroundColor: Color(0xff2F1E06),
          disabledColor: Color(0xa15D4524),
          shape: StadiumBorder(),
          brightness: Brightness.dark,
          labelPadding: EdgeInsets.all(8),
          labelStyle: TextStyle(),
          padding: EdgeInsets.all(8),
          secondaryLabelStyle: TextStyle(),
          secondarySelectedColor: Colors.white38,
          selectedColor: Colors.white
          // chip theme
          ),
      platform: TargetPlatform.android,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      applyElevationOverlayColor: true,
      pageTransitionsTheme: PageTransitionsTheme(
          //page transition theme
          ),
      appBarTheme: AppBarTheme(
          //app bar theme
          ),
      bottomAppBarTheme: BottomAppBarTheme(
          // bottom app bar theme
          ),
      colorScheme: ColorScheme(
          primary: Color(0xff5D4524),
          primaryVariant: Color(0x1a311F06),
          secondary: Color(0xff226b80),
          secondaryVariant: Color(0xaa226b80),
          brightness: Brightness.dark,
          background: Color(0xffB5BFD3),
          error: Colors.red,
          onBackground: Color(0xffB5BFD3),
          onError: Colors.red,
          onPrimary: Color(0xff5D4524),
          onSecondary: Color(0xff226b80),
          onSurface: Color(0xff226b80),
          surface: Color(0xff226b80)),
      snackBarTheme: SnackBarThemeData(
          // snack bar theme
          ),
      dialogTheme: DialogTheme(
          // dialog theme
          ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          // floating action button theme
          ),
      navigationRailTheme: NavigationRailThemeData(
          // navigation rail theme
          ),
      typography: Typography.material2018(),
      cupertinoOverrideTheme: CupertinoThemeData(
          //cupertino theme
          ),
      bottomSheetTheme: BottomSheetThemeData(
          //bottom sheet theme
          ),
      popupMenuTheme: PopupMenuThemeData(
          //pop menu theme
          ),
      bannerTheme: MaterialBannerThemeData(
          // material banner theme
          ),
      dividerTheme: DividerThemeData(
          //divider, vertical divider theme
          ),
      buttonBarTheme: ButtonBarThemeData(
          // button bar theme
          ),
      fontFamily: selectedFont,
      splashFactory: InkSplash.splashFactory);
}
