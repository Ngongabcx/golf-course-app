import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

final userController = Get.put(AuthenticationController());
final now = DateTime.now();

void userDetailsSubmitForm(String id) {
  // userController.validateCreateUserForm();
  userController.createUser({
    'firstname': userController.firstnameController.text,
    'lastname': userController.lastnameController.text,
    'address': userController.addressController.text,
    'gender': userController.genderController.text,
    'hcp': userController.hcpController.text,
    "dob": "2021/03/19",
    "dateJoined": now.toString(),
    "usertypeId": 2,
    'aspnetusersId': id,
  });
}
