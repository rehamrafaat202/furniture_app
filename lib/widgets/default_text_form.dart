import 'package:flutter/material.dart';

Widget defaultFormText(
        {required TextEditingController control,
        required TextInputType type,
        required dynamic validator,
        Function? onSubmit,
        bool isPassword = false,
        required String label,
        r}) =>
    TextFormField(
        controller: control,
        keyboardType: type,
        validator: validator,
        onFieldSubmitted: (s) {
          onSubmit!(s);
        },
        // decoration: InputDecoration(
        //     labelText: label, focusColor: Theme.of(context).primaryColor),
        decoration: InputDecoration(
          label: Text(
            label,
          ),
        ));
