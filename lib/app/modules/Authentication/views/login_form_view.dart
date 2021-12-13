import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:gcms/constants/constant.dart';

import 'package:get/get.dart';

class LoginFormView extends GetView {
  final _controller = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildLoginInputForm(
          'Email',
          false,
          isNumber: false,
          isMobile: false,
          textEditingController: _controller.usernameController,
        ),
        buildLoginInputForm(
          'Password',
          true,
          isNumber: false,
          textEditingController: _controller.passwordController,
        ),
      ],
    );
  }

  Padding buildLoginInputForm(String label, bool pass,
      {String? textPrefix,
      bool isNumber = false,
      bool isMobile = false,
      TextEditingController? textEditingController}) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Obx(
          () => TextFormField(
            controller: textEditingController,
            style: TextStyle(color: kPrimaryColor),
            obscureText: pass ? _controller.isObscure.value : false,
            expands: _controller.iamimportant.value,
            //maxLength: isMobile ? 9 : 6,
            // keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            // inputFormatters: isMobile
            //     ? [
            //         FilteringTextInputFormatter.allow(RegExp('([1-9]+([0-9]+)?)')),
            //       ]
            //     : [
            //         FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            //       ],
            decoration: InputDecoration(
                fillColor: kWhiteColor,
                counterStyle: TextStyle(
                  height: double.minPositive,
                ),
                counterText: "",
                prefixText: textPrefix,
                prefixStyle: TextStyle(color: kPrimaryColor),
                filled: true,
                labelText: label,
                labelStyle: TextStyle(color: kPrimaryColor),
                border: InputBorder.none,
                suffixIcon: pass
                    ? Obx(
                        () => IconButton(
                          onPressed: () {
                            _controller.isObscure.value =
                                !_controller.isObscure.value;
                          },
                          icon: _controller.isObscure.value
                              ? Icon(
                                  Icons.visibility_off,
                                  color: kPrimaryColor,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: kPrimaryColor,
                                ),
                        ),
                      )
                    : null),
          ),
        ));
  }
}
