import 'package:ev_charging/page/stationall/component/bodystation.dart';
import 'package:flutter/material.dart';

class StationAll extends StatefulWidget {
  const StationAll({super.key});

  @override
  State<StationAll> createState() => _StationAllState();
}

class _StationAllState extends State<StationAll> {
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
        title: const Text(
          "ສະຖານນີທັງໝົດ",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: BodyStation(),
      ),
    );
  }
}
