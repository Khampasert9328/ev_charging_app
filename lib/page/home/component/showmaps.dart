import 'dart:typed_data';

import 'package:ev_charging/busines%20logic/infocharg/info_charg_provider.dart';
import 'package:ev_charging/page/home/provider/getchargebyid_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class ShowMaps extends StatefulWidget {
  const ShowMaps({super.key});

  @override
  State<ShowMaps> createState() => _ShowMapsState();
}

class _ShowMapsState extends State<ShowMaps> {
  final List<Marker> _marker = [];

  Future<void> _onMapCreate(GoogleMapController controller) async {
    final data = context.read<InfoChargProvider>().getchargmodels!.data;
    Future<Uint8List> getBytesFromAsset(String path, int width) async {
      ByteData data = await rootBundle.load(path);
      ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
      ui.FrameInfo fi = await codec.getNextFrame();
      return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
    }

    final Uint8List markerIcon = await getBytesFromAsset('images/logocharge.png', 100);

    _marker.clear();
    setState(() {
      for (var i = 0; i < data.length; i++) {
        _marker.add(Marker(
          onTap: () {
            Provider.of<GetChargeByIdProvider>(context, listen: false).getchargebyid(data[i].id);
          },
          icon: BitmapDescriptor.fromBytes(markerIcon),
          markerId: MarkerId(data[i].id),
          position: LatLng(
            double.parse(data[i].latLocation.toString()),
            double.parse(
              data[i].lngLacation.toString(),
            ),
          ),
          infoWindow: InfoWindow(
            title: data[i].name,
          ),
        ));
      }
    });
  }

  @override
  void initState() {
    context.read<InfoChargProvider>().getchargprovider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoChargProvider>(builder: ((context, value, child) {
      if (value.isload) {
        return CircularProgressIndicator();
      }
      return Container(
        color: Colors.grey,
        child: GoogleMap(
          markers: Set<Marker>.of(_marker),
          onMapCreated: _onMapCreate,
          initialCameraPosition: CameraPosition(
            zoom: 16.0,
            target: LatLng(
              double.parse(value.getchargmodels!.data[0].latLocation.toString()),
              double.parse(value.getchargmodels!.data[0].lngLacation.toString()),
            ),
          ),
          mapType: MapType.normal,
        ),
      );
    }));
  }
}
