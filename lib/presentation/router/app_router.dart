import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/strings.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home/home_screen.dart';

import '../screens/login/login_screen.dart';
import '../screens/register/register_screen.dart.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      // case home:
      //   return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return null;
    }
  }
}
