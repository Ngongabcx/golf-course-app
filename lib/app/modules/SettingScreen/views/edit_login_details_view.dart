import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:gcms/app/modules/SettingScreen/views/setting_screen_view.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/app/modules/commonWidgets/custom_appbar.dart';
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
      body: Column(
        children: [
          CustomAppBar(
            Icons.arrow_back_ios_outlined,
            Icons.settings_outlined,
            leftCallBack: () => Get.back(),
            rightCallBack: () => Get.to(SettingScreenView()),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Expanded(
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
                    false,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomTextFormFieldWidget(
                    _controller.signUpConfirmPasswordController,
                    "Confirm Password",
                    (s) {},
                    true,
                    false,
                    false,
                  ),
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
                        _controller.updateRegister({
                          'password': _controller.passwordController.text,
                        });
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
