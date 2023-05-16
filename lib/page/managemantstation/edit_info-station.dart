// ignore: file_names
import 'package:ev_charging/page/managemantstation/page/body_edit_station.dart';
import 'package:flutter/material.dart';

class EditInfoStation extends StatefulWidget {
  const EditInfoStation({super.key});

  @override
  State<EditInfoStation> createState() => _EditInfoStationState();
}

class _EditInfoStationState extends State<EditInfoStation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
        title: const Text(
          "ແກ້ໄຂຂໍ້ມູນ",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: BodyEditStation(),
    );
  }
}
