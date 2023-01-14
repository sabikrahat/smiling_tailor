import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes.dart';

const darkUiConfig = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.light,
  systemNavigationBarColor: _backgroundColor,
  systemNavigationBarIconBrightness: Brightness.light,
);

const darkPrimaryColor = Color(0xFF454CF2);
const _headLineTextColor = Color(0xFF1B3A68);
const _iconColorSecondary = Color(0xFF454CF2);
const _backgroundColor = Color.fromARGB(255, 20, 20, 20);
const _bodyTextColor = Colors.grey;
const _unselectedColor = Colors.blueGrey;
const _titleTextColor = Color.fromARGB(255, 200, 200, 200);
const _primaryLightColor = Color.fromARGB(100, 0, 150, 135);
const _cardBackgroundColor = Color.fromARGB(255, 27, 35, 58);
const _scaffoldBackgroundColor = Color.fromARGB(255, 14, 14, 14);
const _floatingActionButtonColor = Color(0xFF454CF2);
const _shadowColor = Color.fromARGB(90, 0, 0, 0);

final darkTheme = ThemeData(
  useMaterial3: true,
  cardTheme: _cardTheme,
  textTheme: _textTheme,
  fontFamily: fontFamily,
  radioTheme: _radioTheme,
  shadowColor: _shadowColor,
  appBarTheme: _appBarTheme,
  tabBarTheme: _tabBarTheme,
  dialogTheme: _dialogTheme,
  tooltipTheme: _tooltipTheme,
  brightness: Brightness.dark,
  listTileTheme: _listTileTheme,
  snackBarTheme: _snackBarTheme,
  primaryColor: darkPrimaryColor,
  cardColor: _cardBackgroundColor,
  backgroundColor: _backgroundColor,
  unselectedWidgetColor: _unselectedColor,
  bottomNavigationBarTheme: _bottomNavBar,
  secondaryHeaderColor: _primaryLightColor,
  textSelectionTheme: _textSelectionTheme,
  outlinedButtonTheme: _outlinedButtonTheme,
  elevatedButtonTheme: _elevatedButtonTheme,
  indicatorColor: _floatingActionButtonColor,
  inputDecorationTheme: _darkInputDecorationTheme,
  progressIndicatorTheme: _progressIndicatorTheme,
  scaffoldBackgroundColor: _scaffoldBackgroundColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  floatingActionButtonTheme: _floatingActionButtonTheme,
  iconTheme: const IconThemeData(color: _iconColorSecondary),
  primaryIconTheme: const IconThemeData(color: darkPrimaryColor),
);

InputDecorationTheme _darkInputDecorationTheme = InputDecorationTheme(
  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  enabledBorder: OutlineInputBorder(
    borderRadius: borderRadius12,
    gapPadding: 10,
    borderSide: const BorderSide(color: _bodyTextColor, width: 1.0),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: borderRadius12,
    gapPadding: 10,
    borderSide: const BorderSide(color: _titleTextColor, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: borderRadius12,
    gapPadding: 10,
    borderSide: const BorderSide(color: darkPrimaryColor, width: 1.3),
  ),
  floatingLabelStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: darkPrimaryColor,
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: borderRadius12,
    gapPadding: 10,
    borderSide: const BorderSide(color: Colors.red, width: 1.3),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: borderRadius12,
    gapPadding: 10,
    borderSide: const BorderSide(color: Colors.red, width: 1.3),
  ),
  suffixIconColor: darkPrimaryColor,
  prefixIconColor: darkPrimaryColor,
  errorMaxLines: 3,
);

const _textSelectionTheme = TextSelectionThemeData(
  cursorColor: darkPrimaryColor,
  selectionColor: darkPrimaryColor,
  selectionHandleColor: darkPrimaryColor,
);

final _snackBarTheme = SnackBarThemeData(
  actionTextColor: _textTheme.labelSmall!.color,
  contentTextStyle: _textTheme.labelSmall,
  backgroundColor: Colors.transparent,
  behavior: SnackBarBehavior.floating,
  shape: roundedRectangleBorder30,
  elevation: 0.0,
);

final _tabBarTheme = TabBarTheme(
  labelColor: _cardBackgroundColor,
  unselectedLabelColor: _unselectedColor,
  indicatorSize: TabBarIndicatorSize.tab,
  unselectedLabelStyle:
      _textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),
  labelStyle: _textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600),
  indicator: BoxDecoration(
    color: darkPrimaryColor,
    borderRadius: borderRadius10,
  ),
);

final _cardTheme = CardTheme(
  shape: roundedRectangleBorder12,
  shadowColor: _shadowColor,
  color: _backgroundColor,
  elevation: 0,
);

final _radioTheme = RadioThemeData(
  fillColor: MaterialStateProperty.all(darkPrimaryColor),
  overlayColor: MaterialStateProperty.all(_primaryLightColor),
);

final _listTileTheme = ListTileThemeData(shape: roundedRectangleBorder30);

final _dialogTheme = DialogTheme(
  backgroundColor: _cardBackgroundColor,
  shape: roundedRectangleBorder30,
);

final _tooltipTheme = TooltipThemeData(
  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
  decoration: BoxDecoration(
    borderRadius: borderRadius15,
    color: _floatingActionButtonColor.withOpacity(0.9),
  ),
  textStyle: _textTheme.titleSmall,
);

const _appBarTheme = AppBarTheme(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(30),
      bottomLeft: Radius.circular(30),
    ),
  ),
  shadowColor: _shadowColor,
  iconTheme: IconThemeData(color: _iconColorSecondary),
  color: _backgroundColor,
  elevation: 1.5,
  titleTextStyle: TextStyle(
    color: _titleTextColor,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  ),
);

const _floatingActionButtonTheme = FloatingActionButtonThemeData(
  backgroundColor: _floatingActionButtonColor,
  elevation: 2.0,
);

const _progressIndicatorTheme = ProgressIndicatorThemeData(
  refreshBackgroundColor: _primaryLightColor,
  circularTrackColor: _primaryLightColor,
  linearTrackColor: _primaryLightColor,
  color: darkPrimaryColor,
);

final _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    textStyle: _textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
    backgroundColor: darkPrimaryColor,
    shape: roundedRectangleBorder12,
    foregroundColor: _cardBackgroundColor,
    elevation: 0.0,
    padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 50.0),
  ),
);

final _outlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    textStyle: _textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
    shape: roundedRectangleBorder12,
    foregroundColor: darkPrimaryColor,
    elevation: 0.0,
    side: const BorderSide(color: darkPrimaryColor),
    padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 50.0),
  ),
);

const _textTheme = TextTheme(
  titleSmall: TextStyle(
    fontWeight: FontWeight.w700,
    color: _titleTextColor,
  ),
  titleMedium: TextStyle(
    fontWeight: FontWeight.w700,
    color: _titleTextColor,
  ),
  titleLarge: TextStyle(
    fontWeight: FontWeight.w700,
    color: _titleTextColor,
  ),
  labelSmall: TextStyle(
    color: _bodyTextColor,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.7,
  ),
  labelMedium: TextStyle(color: _bodyTextColor, fontWeight: FontWeight.w700),
  labelLarge: TextStyle(color: _bodyTextColor, fontWeight: FontWeight.w700),
  bodySmall: TextStyle(color: _bodyTextColor),
  bodyMedium: TextStyle(color: _bodyTextColor),
  bodyLarge: TextStyle(
      color: _bodyTextColor, fontSize: 16, fontWeight: FontWeight.w700),
  headlineLarge:
      TextStyle(fontWeight: FontWeight.w900, color: _headLineTextColor),
);

const _bottomNavBar = BottomNavigationBarThemeData(
  unselectedItemColor: _unselectedColor,
  type: BottomNavigationBarType.fixed,
  selectedItemColor: darkPrimaryColor,
  showUnselectedLabels: true,
  elevation: 30,
  selectedLabelStyle: TextStyle(
    fontWeight: FontWeight.w700,
    color: darkPrimaryColor,
    fontSize: 10,
  ),
  unselectedLabelStyle: TextStyle(
    fontWeight: FontWeight.w600,
    color: _unselectedColor,
    fontSize: 10,
  ),
);

const darkGradiants = [
  [Color.fromARGB(150, 0, 85, 74), Color.fromARGB(255, 0, 85, 74)],
  [Color.fromARGB(150, 44, 50, 56), Color.fromARGB(255, 44, 50, 56)],
  [Color.fromARGB(150, 56, 101, 122), Color.fromARGB(255, 56, 101, 122)],
  [Color.fromARGB(150, 25, 133, 167), Color.fromARGB(255, 25, 133, 167)],
  [Color.fromARGB(150, 20, 59, 119), Color.fromARGB(255, 20, 59, 119)],
];
