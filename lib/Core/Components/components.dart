import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

abstract class Components {
  Widget defaultButton();
  Widget defaultIconButton();
  Widget defaultDivider();
}

Widget defaultDivider() => Container(
      width: double.infinity,
      height: 0.4,
      color: Colors.grey,
    );
Widget defaultTextFormField(
        {label, preIcon, controller, validator, suffix, isSecure}) =>
    TextFormField(
      obscureText: true,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: preIcon,
        labelText: '$label',
        suffixIcon: suffix,
      ),
    );

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      textColor: Colors.white,
      fontSize: 16.0,
      webBgColor: chooseToastColor(state: state),
      webPosition: 'bottom',
    );

// #FF0000
// #00FF00
// ignore: constant_identifier_names
enum ToastStates { SUCCESS, ERROR, WARNING }

String chooseToastColor({required ToastStates state}) {
  String color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = '#3A913A';
      break;
    case ToastStates.ERROR:
      color = '#FF0000';
      break;
    case ToastStates.WARNING:
      color = '#FFBF00';
      break;
  }
  return color;
}

Widget defaultButton(
        {required void Function() function,
        required String label,
        context,
        @required Color? color}) =>
    Container(
      decoration: BoxDecoration(
        color: color == null ? ThemeColors.primary : color,
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      height: 47,
      alignment: AlignmentDirectional.center,
      width: double.infinity,
      child: MaterialButton(
        onPressed: function,
        child: Container(
            width: double.infinity,
            alignment: AlignmentDirectional.center,
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 25),
            )),
      ),
    );

Widget defaultIconButton(
        {required void Function() function,
        required String label,
        required Icon icon}) =>
    Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromARGB(150, 51, 102, 204),
            Color.fromARGB(255, 51, 102, 204),
          ]),
          borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      height: 50,
      child: MaterialButton(
        onPressed: function,
        child: Row(children: [
          icon,
          const SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
