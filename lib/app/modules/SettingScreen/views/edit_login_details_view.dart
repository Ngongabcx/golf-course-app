import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:gcms/app/modules/SettingScreen/views/setting_screen_view.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loading_provider.dart';
import 'package:gcms/app/modules/commonWidgets/textFormField.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';
import 'package:get/get.dart';
import 'package:provider/src/provider.dart';

class EditLoginDetailsView extends GetView {
  final _controller = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: kBackgroundColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings_outlined,
            ),
            onPressed: () {
              // do something
              Get.to(SettingScreenView());
            },
          ),
        ],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
            child: Expanded(
              child: Form(
                key: _controller.signUpFormKey,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: [
                    // CustomTextFormFieldWidget(
                    //   _controller.signUpEmailController,
                    //   "Email",
                    //   (s) {},
                    //   false,
                    //   false,
                    //   true,
                    // ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormFieldWidget(
                        _controller.signUpPasswordController,
                        "Password",
                        (s) {},
                        true,
                        false,
                        false, (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Password is required.';
                      }
                      return null;
                    }),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormFieldWidget(
                        _controller.signUpConfirmPasswordController,
                        "Confirm Password",
                        (s) {},
                        true,
                        false,
                        false, (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Confirm password is required.';
                      }
                      return null;
                    }),
                    SizedBox(
                      height: 20.0,
                    ),
                    Obx(() {
                      //Returning loader and dismissing it once processing status changes
                      Future.delayed(Duration.zero, () async {
                        context
                            .read<LoadingProvider>()
                            .setLoad(_controller.isProcessing.value);
                      });
                      //Dismissing keyboard
                      FocusScope.of(context).requestFocus(new FocusNode());
                      return CustomButton(
                        text: (_controller.isProcessing.value == true
                            ? 'Processing'
                            : 'Submit'),
                        textStyle: GcmsTheme.lightTextTheme.bodyText2,
                        onPressed: () {
                          _controller.updateRegister(
                            {
                              'password':
                                  _controller.signUpPasswordController.text,
                            },
                            _controller.storage.read('aspUserID').toString(),
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
