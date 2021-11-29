import 'package:flutter/material.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/app/modules/commonWidgets/textFormField.dart';
import 'package:gcms/theme/gcms_theme.dart';
import '../controllers/setting_screen_controller.dart';
import 'package:get/get.dart';

class UserDetailsScreenView extends GetView<SettingScreenController> {
  final userController = Get.put(SettingScreenController());
  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Details',
          style: TextStyle(fontSize: 16.0),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: userController.userFormKey,
          child: ListView(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Enter your details here',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: CustomTextFormFieldWidget(
                  controller.firstnameController,
                  'First name',
                  (s) {},
                  false,
                  false,
                  false,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: CustomTextFormFieldWidget(
                  controller.lastnameController,
                  'Last name',
                  (s) {},
                  false,
                  false,
                  false,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: CustomTextFormFieldWidget(
                  controller.addressController,
                  'Address',
                  (s) {},
                  false,
                  false,
                  false,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: CustomTextFormFieldWidget(
                  controller.genderController,
                  'Gender',
                  (s) {},
                  false,
                  false,
                  false,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: CustomTextFormFieldWidget(
                  controller.hcpController,
                  'Handicap',
                  (s) {},
                  false,
                  false,
                  false,
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Obx(
                    () => CustomButton(
                      text: (controller.isProcessing.value == true
                          ? 'Processing...'
                          : 'Submit'),
                      style: GcmsTheme.lightTextTheme.bodyText2,
                      onPressed: () {
                        controller.validateCreateUserForm();
                        controller.createUser({
                          'firstname': controller.firstnameController.text,
                          'lastname': controller.lastnameController.text,
                          'address': controller.addressController.text,
                          'gender': controller.genderController.text,
                          'hcp': controller.hcpController.text,
                          "dob": "2021/03/19",
                          "dateJoined": now.toString(),
                          "usertypeId": 2,
                          'aspnetusersId':
                              controller.storage.read('aspUserID').toString(),
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
