import 'package:flutter/material.dart';
class Mytextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;




  const Mytextfield({super.key,required this.controller,required this.hintText,required this.obscureText,});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 10,

      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
      ),






    );
  }
}
