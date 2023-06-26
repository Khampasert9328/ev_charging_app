// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:ev_charging/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailMaps extends StatefulWidget {
  num lat, long;
  DetailMaps({Key? key, required this.lat, required this.long}) : super(key: key);

  @override
  State<DetailMaps> createState() => _DetailMapsState();
}

class _DetailMapsState extends State<DetailMaps> {
  static LatLng? _kMapCenter;

  final Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? mapController; //contrller for Google map

  List<Marker> markers = [];
  CameraUpdate? update;

  int id = 1;
  bool onTap = false;

  @override
  void initState() {
    _kMapCenter = LatLng(double.parse(widget.lat.toString()), double.parse(widget.long.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _kMapCenter = LatLng(double.parse(model.latitude??"0"), double.parse(model.longitude??"0"));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('ແຜນທີ່'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(target: _kMapCenter!, zoom: 20.0, tilt: 0, bearing: 0),
            // mapType: MapType.normal,
            onTap: (LatLng latLng) {
              onTap = true;
              Marker fMarker = Marker(
                markerId: const MarkerId('1'),
                position: LatLng(latLng.latitude, latLng.longitude),
                icon: BitmapDescriptor.defaultMarker,
              );
              markers.add(fMarker);
              id = id + 0;
            },
            onCameraMove: (object) async {
              mapController = await _controller.future;
              update = CameraUpdate.newCameraPosition(CameraPosition(
                  target: LatLng(double.parse(widget.lat.toString()), double.parse(widget.long.toString())),
                  zoom: 11.0));
            },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: onTap == true
                ? markers.map((e) => e).toSet()
                : {
                    Marker(
                      markerId: const MarkerId("marker1"),
                      position: _kMapCenter!,
                      draggable: true,
                      onDragEnd: (value) {
                        // value is the new position
                      },
                      icon: BitmapDescriptor.defaultMarker,
                    )
                  },
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: FloatingActionButton.extended(
              backgroundColor: EV_Colors.yellowbtncolor,
              onPressed: () {
                Navigator.pop(context, true);
              },
              label: const Text(
                "ກັບຄືນ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
