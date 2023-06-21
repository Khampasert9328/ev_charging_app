import 'package:flutter/material.dart';

class TextFormInfo extends StatelessWidget {
  final String? text;
  final VoidCallback onchange;
  final TextEditingController? controller;
  final ValueChanged ontap;
  const TextFormInfo({
    super.key,
    required this.text,
    required this.onchange,
    required this.controller,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onChanged: ontap,
        controller: controller,
        onEditingComplete: onchange,
        cursorColor: Colors.grey[200],
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          hintText: text,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
