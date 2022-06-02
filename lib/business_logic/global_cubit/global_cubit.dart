import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/message_model.dart';

import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  IconData suffix1 = Icons.visibility_outlined;
  bool isPassword1 = true;
  void changePassWordVisibility1() {
    isPassword1 = !isPassword1;
    suffix1 =
        isPassword1 ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeVisibility1());
  }

  IconData suffix2 = Icons.visibility_outlined;
  bool isPassword2 = true;
  void changePassWordVisibility2() {
    isPassword2 = !isPassword2;
    suffix2 =
        isPassword2 ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeVisibility2());
  }

  ////////////////////////////////////Register
  late MessageModel registerDate;
  void postRegister(
      {required String name,
      required String email,
      required String password,
      required String phone}) {
    emit(LoadingRegisterState());
    DioHelper.postData(
      url: registerURL,
      body: {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone
      },
    ).then(
      (value) {
        registerDate = MessageModel.fromJson(value.data);
        print(registerDate);
        emit(SuccessfulRegisterState(registerDate));
      },
    ).catchError(
      (error) {
        print(error.toString());
        emit(ErrorRegisterState(error.toString()));
      },
    );
  }

  /////////////////////////////////Login
  late MessageModel loginDate;
  void postLogin({
    required String email,
    required String password,
  }) {
    emit(LoadingLoginState());
    DioHelper.postData(
      url: loginURL,
      body: {
        "email": email,
        "password": password,
      },
    ).then(
      (value) {
        loginDate = MessageModel.fromJson(value.data);
        print(loginDate.account![0].name);
        emit(SuccessfulLoginState(loginDate));
      },
    ).catchError(
      (error) {
        print(error.toString());
        emit(ErrorLoginState(error.toString()));
      },
    );
  }
}
