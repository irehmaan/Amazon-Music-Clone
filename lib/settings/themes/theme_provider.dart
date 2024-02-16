import 'package:amazonmusiclone/settings/themes/dark_theme.dart';
import 'package:amazonmusiclone/settings/themes/light_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lighTheme;
  // box color for dark and light theme
  late Color _colorLight;
  late Color _colorDark;

  late Color _dashBoardColorLight = Colors.white;
  late Color _dashBoardColorDark = Colors.black;

  ThemeData get themeData => _themeData;

  
  bool get enableDarkTheme => _themeData == darkTheme;
  

  Color get dashBoardColorDark => _dashBoardColorDark;
  Color get dashBoardColorLight => _dashBoardColorLight;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lighTheme) {
      themeData = darkTheme;
    } else {
      themeData = lighTheme;
    }
  }

  containerColor(Color color) {
    if (_themeData == lighTheme) {
      _colorLight = color;
    } else {
      _colorDark = color;
    }
  }


}
