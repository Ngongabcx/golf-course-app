import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:gcms/app/modules/SettingScreen/controllers/setting_screen_controller.dart';
import 'package:gcms/app/modules/SettingScreen/views/setting_screen_view.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/app/modules/commonWidgets/custom_date_time_picker.dart.dart';
import 'package:gcms/app/modules/commonWidgets/list_string_dropdown.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loader.dart';
import 'package:gcms/app/modules/commonWidgets/textFormField.dart';
import 'package:gcms/app/modules/home/models/user_model.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditUserDetailsView extends GetView<SettingScreenController> {
  final userController = Get.put(AuthenticationController());
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var usrPayload = userFromJson(userController.storage.read('user'));
    var usr = usrPayload.payload!.first;
    userController.firstnameController.text = usr.fname.toString();
    userController.lastnameController.text = usr.lname.toString();
    userController.addressController.text = usr.address.toString();
    userController.hcpController.text = usr.hcp.toString();
    userController.selectedDate.value = usr.dob.toString();
    userController.selectedGender.value = usr.gender.toString();

    return Obx(() {
      return controller.isProcessing.value == true
          ? Loader()
          : Scaffold(
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
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 25.0),
                      child: Form(
                        key: userController.userFormKey,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 5, 0, 0),
                              child: CustomTextFormFieldWidget(
                                userController.firstnameController,
                                usr.fname.toString(),
                                (s) {},
                                false,
                                false,
                                false,
                                (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return '${usr.fname.toString()} is required.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 20, 0, 0),
                              child: CustomTextFormFieldWidget(
                                userController.lastnameController,
                                usr.lname.toString(),
                                (s) {},
                                false,
                                false,
                                false,
                                (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return '${usr.lname.toString()} is required.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 20, 0, 0),
                              child: CustomTextFormFieldWidget(
                                userController.addressController,
                                usr.address.toString(),
                                (s) {},
                                false,
                                false,
                                false,
                                (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return '${usr.address.toString()} is required.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 20, 0, 0),
                              child: CustomDatePicker(
                                label: DateFormat.yMMMMd().format(usr.dob!),
                                name: 'Date of Birth',
                                initialValue: usr.dob,
                                callback: (newSelectedDate) {
                                  userController.selectedDate.value =
                                      newSelectedDate.toString();
                                  print(newSelectedDate);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 20, 0, 0),
                              child: ListStringDropdown(
                                name: 'gender',
                                label: usr.gender.toString(),
                                hint: usr.gender,
                                listItems: userController.genderOptions,
                                callback: (value) {
                                  userController.selectedGender.value = value!;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 20, 0, 0),
                              child: CustomTextFormFieldWidget(
                                userController.hcpController,
                                usr.hcp.toString(),
                                (s) {},
                                false,
                                true,
                                false,
                                (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return '${usr.hcp.toString()} is required.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 25),
                            Expanded(
                              child: Align(
                                alignment: FractionalOffset.bottomCenter,
                                child: Obx(
                                  () => CustomButton(
                                    textStyle:
                                        GcmsTheme.lightTextTheme.bodyText2,
                                    text: (userController.isProcessing.value ==
                                            true
                                        ? 'Processing...'
                                        : 'Submit'),
                                    onPressed: () {
                                      userController.validateCreateUserForm();
                                      SettingScreenController()
                                          .updateUserDetails(
                                        {
                                          'fname': userController
                                              .firstnameController.text,
                                          'lname': userController
                                              .lastnameController.text,
                                          'address': userController
                                              .addressController.text,
                                          'gender': userController
                                              .selectedGender.value,
                                          'hcp':
                                              userController.hcpController.text,
                                          "dob":
                                              userController.selectedDate.value,
                                        },
                                        userController.storage
                                            .read('aspUserID')
                                            .toString(),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
