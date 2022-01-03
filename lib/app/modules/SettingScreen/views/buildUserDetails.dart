import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:gcms/app/modules/commonWidgets/build_form_builder_date_time_picker_view.dart.dart';
import 'package:gcms/app/modules/commonWidgets/build_form_builder_dropdown.dart';
import 'package:gcms/app/modules/commonWidgets/textFormField.dart';
import 'package:get/get.dart';

class BuildUserDetails extends GetView<AuthenticationController> {
  final userController = Get.put(AuthenticationController());
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: userController.userFormKey,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
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
          // Padding(
          //   padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          //   child: CustomTextFormFieldWidget(
          //     controller.genderController,
          //     'Gender',
          //     (s) {},
          //     false,
          //     false,
          //     false,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: BuildFormBuilderDateTimePickerView(),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: BuildFormBuilderDropdown(),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: CustomTextFormFieldWidget(
              controller.hcpController,
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
          //         text: (controller.isProcessing.value == true
          //             ? 'Processing...'
          //             : 'Submit'),
          //         style: GcmsTheme.lightTextTheme.bodyText2,
          //         onPressed: () {
          //           controller.validateCreateUserForm();
          //           controller.createUser({
          //             'firstname': controller.firstnameController.text,
          //             'lastname': controller.lastnameController.text,
          //             'address': controller.addressController.text,
          //             'gender': controller.genderController.text,
          //             'hcp': controller.hcpController.text,
          //             "dob": "2021/03/19",
          //             "dateJoined": now.toString(),
          //             "usertypeId": 2,
          //             'aspnetusersId':
          //                 controller.storage.read('aspUserID').toString(),
          //           });
          //         },
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
