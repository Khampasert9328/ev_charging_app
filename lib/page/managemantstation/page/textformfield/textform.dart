
import 'package:flutter/material.dart';

class TextFormInfo extends StatelessWidget {
 final String? text;

 const TextFormInfo({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: text,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
