import 'dart:async';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/provider/infon_location_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class SimpleMaps extends StatefulWidget {
  const SimpleMaps({Key? key}) : super(key: key);

  @override
  State<SimpleMaps> createState() => _SimpleMapsState();
}

class _SimpleMapsState extends State<SimpleMaps> {
  static LatLng? _kMapCenter;

  final Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? mapController; //contrller for Google map

  List<Marker> markers = [];
  CameraUpdate? update;

  int id = 1;
  bool onTap = false;

  @override
  void initState() {
    _kMapCenter = LatLng(double.parse(context.read<InfoLocationProvider>().latitude??"0"), double.parse(context.read<InfoLocationProvider>().longtitude??"0"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<InfoLocationProvider>();
    // _kMapCenter = LatLng(double.parse(model.latitude??"0"), double.parse(model.longitude??"0"));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
          Navigator.pop(context, true);
        }, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('ແຜນທີ່'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(target: _kMapCenter!, zoom: 20.0, tilt: 0, bearing: 0),
            // mapType: MapType.normal,
            onTap: (LatLng latLng){
              onTap = true;
                Marker fMarker = Marker(
                  markerId: const MarkerId('1'),
                  position: LatLng(latLng.latitude, latLng.longitude),
                  icon: BitmapDescriptor.defaultMarker,
                );
                markers.add(fMarker);
                id = id + 0;
                setState(() {

                model.setLatitude(latLng.latitude.toString());
                  model.setLongitude(latLng.longitude.toString());
                });
            },
            onCameraMove: (object) async{
              mapController = await _controller.future;
              update = CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(double.parse(model.latitude!),
                  double.parse(model.longtitude!)), zoom: 11.0));
            },
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
            markers: onTap == true ? markers.map((e) => e).toSet() : {
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
            left: 30,
            bottom: 30,
            child: FloatingActionButton.extended(
            backgroundColor: EV_Colors.yellowbtncolor,
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: const Icon(Icons.place),
            label: const Text("ປັກໝຸດ"),
          ),)
        ],
      ),
    );
  }
}
