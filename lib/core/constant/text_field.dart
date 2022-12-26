import 'package:flutter/material.dart';

class InputTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Key keytextFiled;
  const InputTextFiled({super.key,required this.controller,required this.hintText,required this.keytextFiled});
  
  @override
  Widget build(BuildContext context) {
    return TextField(
              decoration:  InputDecoration(
                  hintText: hintText,
              ),
              controller: controller,
          );
  }
}