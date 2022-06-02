import 'package:flutter/cupertino.dart';

double sizeHeight(context, double size) {
  return MediaQuery.of(context).size.height * size;
}

double sizeWidth(context, double size) {
  return MediaQuery.of(context).size.width * size;
}
