import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final String? value;
  final String? hint;
  final void Function(String?)? onChange;
  final List<DropdownMenuItem<String>>? item;
  final FormFieldValidator<String> validator;


  const DropDownWidget({Key? key, required this.value, required this.onChange, required this.item, required this.hint, required this.validator}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: validator,
      decoration:  InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide.none
          )),
      isExpanded: true,
      hint: Text(hint!, style: const TextStyle(fontFamily: 'NotoSan', overflow: TextOverflow.ellipsis)),
      style: const TextStyle(
          color: Colors.black, fontSize: 16.0, fontFamily: 'NotoSan'),
      items: item,
      value: value,
      onChanged: onChange,
    );
  }
}

