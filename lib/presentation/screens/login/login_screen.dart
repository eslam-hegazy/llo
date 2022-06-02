import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/image_manager.dart';
import 'package:magdsoft_flutter_structure/constants/navigate_manager.dart';
import 'package:magdsoft_flutter_structure/constants/size_manager.dart';
import 'package:magdsoft_flutter_structure/constants/strings.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home/home_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/Toast.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/defaultButton.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/defaultText.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/defaultTextForm.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/logo.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/space.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      builder: (context, state) {
        var cubit = GlobalCubit.get(context);
        return Scaffold(
          backgroundColor: AppColor.backgroundColor,
          body: SafeArea(
            child: Column(
              children: [
                Logo(),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 50, right: 40, left: 40, bottom: 12),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: AppColor.white,
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            DefaultTextForm(
                              controller: emailController,
                              hintText: "Email",
                              type: TextInputType.emailAddress,
                              secure: false,
                              iconPress: null,
                              error: "Please enter your email",
                            ),
                            DefaultTextForm(
                              controller: passwordController,
                              hintText: "Password",
                              type: TextInputType.visiblePassword,
                              secure: cubit.isPassword1,
                              iconPress: IconButton(
                                onPressed: () {
                                  cubit.changePassWordVisibility1();
                                },
                                icon: Icon(cubit.suffix1),
                              ),
                              error: "Please enter password",
                            ),
                            Space(height: sizeHeight(context, 0.05), width: 0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DefaultButton(
                                  text: 'Register',
                                  color: AppColor.buttonColor,
                                  press: () {
                                    navigatorPushReplacement(context, register);
                                  },
                                ),
                                state is LoadingLoginState
                                    ? Container(
                                        alignment: Alignment.center,
                                        child:
                                            const CircularProgressIndicator(),
                                      )
                                    : DefaultButton(
                                        text: 'Login',
                                        color: AppColor.buttonColor,
                                        press: () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            cubit.postLogin(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            );
                                          }
                                        },
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is SuccessfulLoginState) {
          if (state.message.status == 200) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
              return HomeScreen(
                model: state.message,
              );
            }));
            Fluttertoast.showToast(
              msg: "welcome ${state.message.account![0].name}",
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } else {
            Fluttertoast.showToast(
              msg: "User Not Found",
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        }
        if (state is ErrorLoginState) {
          Fluttertoast.showToast(
            msg: state.error,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
    );
  }
}
