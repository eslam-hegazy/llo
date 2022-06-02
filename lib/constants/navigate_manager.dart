import 'package:flutter/cupertino.dart';

Future navigatorPush(context, screen) {
  return Navigator.pushNamed(context, screen);
}

Future navigatorPushReplacement(context, screen) {
  return Navigator.popAndPushNamed(context, screen);
}
