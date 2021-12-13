import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gcms/constants/constant.dart';

class LogInForm extends StatefulWidget {
  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildLoginInputForm(
          'Email',
          false,
          isNumber: false,
          isMobile: false,
        ),
        buildLoginInputForm(
          'Password',
          true,
          isNumber: false,
        ),
      ],
    );
  }

  Padding buildLoginInputForm(String label, bool pass,
      {String? textPrefix, bool isNumber = false, bool isMobile = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: kPrimaryColor),
        obscureText: pass ? _isObscure : false,
        maxLength: isMobile ? 9 : 6,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        inputFormatters: isMobile
            ? [
                FilteringTextInputFormatter.allow(RegExp('([1-9]+([0-9]+)?)')),
              ]
            : [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
        decoration: InputDecoration(
            fillColor: kWhiteColor,
            counterStyle: TextStyle(
              height: double.minPositive,
            ),
            counterText: "",
            prefixText: textPrefix,
            prefixStyle: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: kPrimaryColor),
            filled: true,
            labelText: label,
            labelStyle: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: kPrimaryColor),
            border: InputBorder.none,
            suffixIcon: pass
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: _isObscure
                        ? Icon(
                            Icons.visibility_off,
                            color: kPrimaryColor,
                          )
                        : Icon(
                            Icons.visibility,
                            color: Colors.blueAccent,
                          ),
                  )
                : null),
      ),
    );
  }
}
