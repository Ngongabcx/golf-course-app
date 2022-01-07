import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Authentication/providers/auth_provider.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:gcms/app/modules/home/providers/user_provider.dart';
import 'package:gcms/app/modules/home/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class AuthenticationController extends GetxController {
  var selectedDate = ''.obs;
  var genderOptions = ['Male', 'Female'];
  var selectedGender = ''.obs;
  final userFormKey = GlobalKey<FormState>();
  var currentStep = 0.obs;
  var iamimportant = false.obs;
  var isObscure = true.obs;
  var _localAuth = LocalAuthentication();
  bool hasFingerPrintLock = false;
  bool hasFaceLock = false;
  var isUserAuthenticated = false.obs;
  final signUpFormKey = GlobalKey<FormState>();
  var storage = GetStorage();
  var isProcessing = false.obs;
  var tkn;
  late final TextEditingController usernameController,
      passwordController,
      signUpEmailController,
      signUpPasswordController,
      signUpConfirmPasswordController,
      firstnameController,
      lastnameController,
      addressController,
      imageController,
      dobController,
      genderController,
      hcpController;
  @override
  void onInit() {
    super.onInit();
    _getAllBiometrics();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    signUpEmailController = TextEditingController();
    signUpPasswordController = TextEditingController();
    signUpConfirmPasswordController = TextEditingController();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    addressController = TextEditingController();
    imageController = TextEditingController();
    dobController = TextEditingController();
    genderController = TextEditingController();
    hcpController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
    //authenticateUser();
  }

  @override
  void onClose() {}
  void _getAllBiometrics() async {
    // Check whether there is local authentication available on this device or not
    bool hasLocalAuthentication = await _localAuth.canCheckBiometrics;
    if (hasLocalAuthentication) {
      List<BiometricType> availableBiometrics =
          await _localAuth.getAvailableBiometrics();
      hasFaceLock = availableBiometrics.contains(BiometricType.face);
      hasFingerPrintLock =
          availableBiometrics.contains(BiometricType.fingerprint);
      storage.write("hasFaceLock", hasFaceLock);
      storage.write("hasFingerPrintLock", hasFingerPrintLock);
    } else {
      storage.write("hasFaceLock", hasFaceLock);
      storage.write("hasFingerPrintLock", hasFingerPrintLock);
    }
  }

  void authenticateUser(bool isLoggingIn) async {
    try {
      const androidMessage = const AndroidAuthMessages(
        cancelButton: 'Cancel',
        goToSettingsButton: 'settings',
        goToSettingsDescription: 'Please set up your Fingerprint/Face Id.',
        biometricHint: 'Verify your identity',
      );
      isUserAuthenticated.value = await _localAuth.authenticate(
        localizedReason: 'Please provide authetication',
        biometricOnly: true,
        useErrorDialogs: true,
        stickyAuth: true,
        androidAuthStrings: androidMessage,
      );
      if (isUserAuthenticated.value) {
        if (!isLoggingIn) {
          storage.write("isBiometricActivated",true);
          ShowSnackBar(
            title: "Success",
            message: "Authentication feature successfully activated.",
            backgroundColor: Colors.green);
        } else {
          //Log user in
        }
      } else {
        // ShowSnackBar(
        //     title: "Error",
        //     message: "Authentication Cancelled",
        //     backgroundColor: Colors.red);
      }
    } catch (e) {
      // ShowSnackBar(
      //     title: "Error", message: e.toString(), backgroundColor: Colors.red);
      print("EXCEPTION --> ${e.toString()}");
    }
  }

  // Save Data
  void login(Map data) {
    try {
      isProcessing(true);
      AuthProvider().login(data).then((resp) async {
        clearTextEditingControllers();
        isProcessing(false);
        print("ACCESSTOKEN ---> " + resp.info!.accessToken.toString());
        print("REFRESHTOKEN ---> " + resp.info!.refreshToken.toString());
        ShowSnackBar(
            title: "Success",
            message: "Login Successful.",
            backgroundColor: Colors.green);
        storage.write("isLoggedIn", true);
        storage.write("accessToken", resp.info!.accessToken);
        storage.write("refreshToken", resp.info!.refreshToken);
        Get.offAllNamed('/home');
      }, onError: (err) {
        isProcessing(false);
        ShowSnackBar(
            title: "Error",
            message: err.toString(),
            backgroundColor: Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      print("<---------EXCEPTION2--------->" + exception.toString());
      ShowSnackBar(
          title: "Exception",
          message: exception.toString(),
          backgroundColor: Colors.red);
    }
  }

  void registration(Map data) {
    print("REGISTRATION MAP --> $data");
    var registered = register({
      'username': data["username"],
      'email': data["email"],
      'password': data["password"]
    });
    if (registered) {
      createUser({
        'Fname': data["firstname"],
        'Lname': data["lastname"],
        'address': data["address"],
        'gender': data["gender"],
        'hcp': data["hcp"],
        "dob": data["dob"],
        "usertypeId": 1,
        'AspNetUsersId': storage.read("aspUserID").toString(),
        "FcmToken": storage.read("fcmToken").toString(),
      });
    }
  }

  bool register(Map data) {
    print(
        "<<-----------REGISTERING USER ACCOUNT WITH PAYLOAD : $data ---------->");
    try {
      isProcessing(true);
      AuthProvider().register(data).then((resp) async {
        print('User data:${resp.info!.accessToken.toString()}');
        clearTextEditingControllers();
        isProcessing(false);
        storage.write("accessToken", resp.info!.accessToken);
        storage.write("refreshToken", resp.info!.refreshToken);
        Map<String, dynamic> tkn =
            Jwt.parseJwt('${storage.read("accessToken")}');
        storage.write("aspUserID", tkn['Id']);
        print(tkn.toString());
        return true;
      }, onError: (err) {
        isProcessing(false);
        ShowSnackBar(
            title: "Error",
            message: err.toString(),
            backgroundColor: Colors.red);
        return false;
      });
    } catch (exception) {
      isProcessing(false);
      print("<---------EXCEPTION2--------->" + exception.toString());
      ShowSnackBar(
          title: "Exception",
          message: exception.toString(),
          backgroundColor: Colors.red);
      return false;
    }
    return true;
  }

  bool validateCreateUserForm() {
    if (firstnameController.text.isEmpty) {
      print('FIRST NAME: ${firstnameController.text}');
      ShowSnackBar(
        title: "First name cannot be empty",
        message: "Provide your first name.",
        backgroundColor: Colors.red,
      );
      return false;
    }
    if (lastnameController.text.isEmpty) {
      print('LAST NAME: ${lastnameController.text}');
      ShowSnackBar(
        title: "Last name cannot be empty",
        message: "Please Provide your last name.",
        backgroundColor: Colors.red,
      );
      return false;
    }
    if (addressController.text.isEmpty) {
      ShowSnackBar(
        title: "Address cannot be empty",
        message: "Please Provide your address.",
        backgroundColor: Colors.red,
      );
      return false;
    }
    // if (!GetUtils.isBlank(value)) {
    //   return 'Provide your gender';
    // }
    if (hcpController.text.isEmpty) {
      ShowSnackBar(
        title: "Handicap cannot be empty",
        message: "Please Provide your handicap.",
        backgroundColor: Colors.red,
      );
      return false;
    }
    return true;
  }

  void createUser(Map data) {
    print("<<-----------SAVING USER DETAILS WITH PAYLOAD : $data ---------->");
    try {
      isProcessing(true);
      UserProvider().createUser(data).then((resp) {
        clearTextEditingControllers();
        storage.write("user", resp);
        var usrPayload = userFromJson(storage.read('user'));
        var usr = usrPayload.payload!.first;
        storage.write("userId", usr.id.toString());
        storage.write("username", usr.aspNetUsers!.userName.toString());
        storage.write("isLoggedIn", true);
        storage.write("hcp", usr.hcp!.toInt());
        storage.write(
            "name", usr.fname.toString() + " " + usr.lname.toString());
        storage.write("profilePic", usr.image);
        isProcessing(false);
        ShowSnackBar(
            title: "Success",
            message: "Account Successfully Created.",
            backgroundColor: Colors.green);
        Get.offAllNamed('/home');
      }, onError: (err) {
        isProcessing(false);
        //TODO : You need to delete the account if creation has failed
        //TODO: Write a delete account function and call it from here
        //TODO: Also call that function when an exception is thrown
        ShowSnackBar(
            title: "Error",
            message: err.toString(),
            backgroundColor: Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      print("<---------EXCEPTION2--------->" + exception.toString());
      ShowSnackBar(
          title: "Exception",
          message: exception.toString(),
          backgroundColor: Colors.red);
    }
  }

  // clear the controllers
  void clearTextEditingControllers() {
    usernameController.clear();
    passwordController.clear();
    signUpEmailController.clear();
    signUpPasswordController.clear();
    signUpConfirmPasswordController.clear();
    firstnameController.clear();
    lastnameController.clear();
    addressController.clear();
    imageController.clear();
    dobController.clear();
    genderController.clear();
    hcpController.clear();
  }
}
