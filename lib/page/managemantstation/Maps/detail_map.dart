// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

class DetailMaps extends StatefulWidget {
  num lat, long;
  DetailMaps({Key? key, required this.lat, required this.long}) : super(key: key);

  @override
  State<DetailMaps> createState() => _DetailMapsState();
}

class _DetailMapsState extends State<DetailMaps> {
  GoogleMapController? mapController; //contrller for Google map

  List<Marker> markers = [];
  CameraUpdate? update;

  int id = 1;
  bool onTap = false;
  Future<void> _onMapCreate(GoogleMapController controller) async {
    Future<Uint8List> getBytesFromAsset(String path, int width) async {
      ByteData data = await rootBundle.load(path);
      ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
      ui.FrameInfo fi = await codec.getNextFrame();
      return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
    }

    final Uint8List markerIcon = await getBytesFromAsset('images/logocharge.png', 150);

    markers.clear();
    setState(() {
      markers.add(
        Marker(
          onTap: () {},
          icon: BitmapDescriptor.fromBytes(markerIcon),
          markerId: MarkerId("1"),
          position: LatLng(
            double.parse(widget.lat.toString()),
            double.parse(
              widget.long.toString(),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // _kMapCenter = LatLng(double.parse(model.latitude??"0"), double.parse(model.longitude??"0"));
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
          "ແຜນທີ່",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          widget.lat == null && widget.long == null
              ? Center(
                child: Image.asset(
                    "images/loading.gif",
                    height: 50.h,
                    width: 50.w,
                  ),
              )
              : GoogleMap(
                  markers: Set<Marker>.of(markers),
                  onMapCreated: _onMapCreate,
                  initialCameraPosition: CameraPosition(
                    zoom: 16.0,
                    target: LatLng(
                      double.parse(widget.lat.toString()),
                      double.parse(widget.long.toString()),
                    ),
                  ),
                  mapType: MapType.normal,
                ),
        ],
      ),
    );
  }
}
