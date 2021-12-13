import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Authentication/providers/auth_provider.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class AuthenticationController extends GetxController {
  var iamimportant = false.obs;
  var isObscure = true.obs;
  var _localAuth = LocalAuthentication();
  var hasFingerPrintLock = false.obs;
  var hasFaceLock = false.obs;
  var isUserAuthenticated = false.obs;
  var storage = GetStorage();
  var isProcessing = false.obs;
  late final TextEditingController usernameController,
      passwordController,
      signUpEmailController,
      signUpPasswordController,
      signUpConfirmPasswordController;
  @override
  void onInit() {
    super.onInit();
    _getAllBiometrics();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    signUpEmailController = TextEditingController();
    signUpPasswordController = TextEditingController();
    signUpConfirmPasswordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void _getAllBiometrics() async {
    // Check whether there is local authentication available on this device or not
    bool hasLocalAuthentication = await _localAuth.canCheckBiometrics;
    if (hasLocalAuthentication) {
      List<BiometricType> availableBiometrics =
          await _localAuth.getAvailableBiometrics();
      hasFaceLock.value = availableBiometrics.contains(BiometricType.face);
      hasFingerPrintLock.value =
          availableBiometrics.contains(BiometricType.fingerprint);
    } else {
      ShowSnackBar("Error", 'Local Authentication not available', Colors.red);
    }
  }

  void authenticateUser() async {
    try {
      const androidMessage = const AndroidAuthMessages(
        cancelButton: 'Cancel',
        goToSettingsButton: 'settings',
        goToSettingsDescription: 'Please set up your Fingerprint/Face.',
        biometricHint: 'Verify your identity',
      );
      isUserAuthenticated.value = await _localAuth.authenticate(
        localizedReason: 'Authenticate Yourself',
        biometricOnly: true,
        useErrorDialogs: true,
        stickyAuth: true,
        androidAuthStrings: androidMessage,
      );
      if (isUserAuthenticated.value) {
        ShowSnackBar("Success", "You are authenticated", Colors.green);
      } else {
        ShowSnackBar("Error", "Authentication Cancelled", Colors.red);
      }
    } catch (e) {
      ShowSnackBar("Error", e.toString(), Colors.red);
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
        ShowSnackBar("Success", "Login Successful.", Colors.green);
        storage.write("isLoggedIn", true);
        storage.write("accessToken", resp.info!.accessToken);
        storage.write("refreshToken", resp.info!.refreshToken);
        Get.offAllNamed('/home');
      }, onError: (err) {
        isProcessing(false);
        ShowSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      print("<---------EXCEPTION2--------->" + exception.toString());
      ShowSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  void register(Map data) {
    try {
      isProcessing(true);
      AuthProvider().register(data).then((resp) {
        clearTextEditingControllers();
        isProcessing(false);
        ShowSnackBar("Success", "Login Successful.", Colors.green);
        storage.write("isLoggedIn", true);
        storage.write("accessToken", resp.info!.accessToken);
        storage.write("refreshToken", resp.info!.refreshToken);
        Get.offAllNamed('/home');
      }, onError: (err) {
        isProcessing(false);
        ShowSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      print("<---------EXCEPTION2--------->" + exception.toString());
      ShowSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  // clear the controllers
  void clearTextEditingControllers() {
    usernameController.clear();
    passwordController.clear();
    signUpEmailController.clear();
    signUpPasswordController.clear();
    signUpConfirmPasswordController.clear();
  }
}
