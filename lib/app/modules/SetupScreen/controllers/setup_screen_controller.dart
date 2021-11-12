import 'package:get/get.dart';
class SetupScreenController extends GetxController {
  final courses = [
    'Chinama Golf Course',
    'Lusaka Golf Club',
    'Bonanza Golf Course',
    'Chilanga Golf Club',
  ];
  var currentSelectedCourse = ''.obs;
  var currentSelectedHole = ''.obs;
  var selectedHole = 0.obs;
  final hole9options = [1, 9, 10, 18];
  final hole18options = [1, 9, 10, 18];

  var currentSelectedGameType = '';
  bool strokePlay = false;
  bool steplefold = false;

  final playersList = ['Tiger Woods', 'Love the third', 'Rory McRoy'];
  var date = 'Not set'.obs;
  var time = "Not set".obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
