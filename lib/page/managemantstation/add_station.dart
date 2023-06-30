import 'package:ev_charging/page/managemantstation/component/body_add_station.dart';
import 'package:ev_charging/utils/translate/language_constants.dart';
import 'package:flutter/material.dart';

class AddStation extends StatefulWidget {
  const AddStation({super.key});

  @override
  State<AddStation> createState() => _AddStationState();
}

class _AddStationState extends State<AddStation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title:  Text(
            translation(context).addinfomationstation,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
         
        ),

        body: const BodyAddStation(),
    );
  }
}