import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/navigate_manager.dart';
import 'package:magdsoft_flutter_structure/constants/strings.dart';
import 'package:magdsoft_flutter_structure/data/models/message_model.dart';

import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/defaultButton.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/defaultText.dart';

class HomeScreen extends StatelessWidget {
  final MessageModel model;

  HomeScreen({required this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "User Data",
          style: TextStyle(color: AppColor.white),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            defaultText(
              text: "Name : ${model.account![0].name}",
              color: AppColor.buttonColor,
              size: 18,
            ),
            defaultText(
              text: "Email : ${model.account![0].email}",
              color: AppColor.buttonColor,
              size: 18,
            ),
            defaultText(
              text: "Phone : ${model.account![0].phone}",
              color: AppColor.buttonColor,
              size: 18,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            Container(
              alignment: Alignment.center,
              child: DefaultButton(
                text: "Logout",
                press: () {
                  navigatorPushReplacement(context, register);
                },
                color: const Color(0xFFAD002F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
