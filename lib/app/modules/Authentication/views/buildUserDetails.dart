import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:gcms/app/modules/commonWidgets/custom_date_time_picker.dart.dart';
import 'package:gcms/app/modules/commonWidgets/list_string_dropdown.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loader.dart';
import 'package:gcms/app/modules/commonWidgets/textFormField.dart';
import 'package:get/get.dart';

class BuildUserDetails extends GetView<AuthenticationController> {
  final userController = Get.put(AuthenticationController());
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return userController.isProcessing.value
          ? Loader()
          : Form(
              key: userController.userFormKey,
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: CustomTextFormFieldWidget(
                      userController.firstnameController,
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
                      userController.lastnameController,
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
                      userController.addressController,
                      'Address',
                      (s) {},
                      false,
                      false,
                      false,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: CustomDatePicker(
                      label: 'Pick your date of birth ',
                      name: 'Date of Birth',
                      callback: (newSelectedDate) {
                        userController.selectedDate.value =
                            newSelectedDate.toString();
                        print(newSelectedDate);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: ListStringDropdown(
                      name: 'gender',
                      label: '',
                      hint: 'Select your gender',
                      listItems: userController.genderOptions,
                      callback: (value) {
                        userController.selectedGender.value = value!;
                        print('Gender opitons ${userController.genderOptions}');
                        print('Picked option $value');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: CustomTextFormFieldWidget(
                      userController.hcpController,
                      'Handicap',
                      (s) {},
                      false,
                      true,
                      false,
                    ),
                  ),

                  const SizedBox(height: 25),
                  // Expanded(
                  //   child: Align(
                  //     alignment: FractionalOffset.bottomCenter,
                  //     child: Obx(
                  //       () => CustomButton(
                  //         text: (userController.isProcessing.value == true
                  //             ? 'Processing...'
                  //             : 'Submit'),
                  //         style: GcmsTheme.lightTextTheme.bodyText2,
                  //         onPressed: () {
                  //           userController.validateCreateUserForm();
                  //           userController.createUser({
                  //             'firstname': userController.firstnameController.text,
                  //             'lastname': userController.lastnameController.text,
                  //             'address': userController.addressController.text,
                  //             'gender': userController.genderController.text,
                  //             'hcp': userController.hcpController.text,
                  //             "dob": "2021/03/19",
                  //             "dateJoined": now.toString(),
                  //             "usertypeId": 2,
                  //             'aspnetusersId':
                  //                 userController.storage.read('aspUserID').toString(),
                  //           });
                  //         },
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            );
    });
  }
}
