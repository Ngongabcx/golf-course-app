import 'package:flutter/material.dart';
import 'package:gcms/app/modules/commonWidgets/textFormField.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

class NotificationDetailsView extends GetView {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('NotificationDetailsView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TextFormField(
            //controller: textEditingController,
            keyboardType: TextInputType.text,
            // validator: (()=>onValidate()),
            obscureText: false,
            decoration: InputDecoration(
              labelText: "TEST",
              labelStyle: const TextStyle(
                color: Color(0xFF95A1AC),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFDBE2E7),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: kPrimaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
            ),
            style: const TextStyle(
              color: Color(0xFF95A1AC),
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          CustomTextFormFieldWidget(
              textEditingController, "TEST2", () {}, false, false, false)
        ],
      )),
    );
  }
}
