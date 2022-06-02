import 'package:flutter/material.dart';

import '../../constants/image_manager.dart';
import '../../constants/size_manager.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeHeight(context, 0.30),
      decoration: const BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage(logoApp),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
