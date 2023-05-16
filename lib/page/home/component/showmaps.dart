import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowMaps extends StatefulWidget {
  const ShowMaps({super.key});

  @override
  State<ShowMaps> createState() => _ShowMapsState();
}

class _ShowMapsState extends State<ShowMaps> {
  double? lat = 17.98666561376467;
  double? lng = 102.63453975675415;

  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;
    ImageConfiguration configuration = createLocalImageConfiguration(context);
    if (lat != null) {
      LatLng latlng1 = LatLng(lat!, lng!);

      cameraPosition = CameraPosition(target: latlng1, zoom: 16.0);
    }
    Marker marker1() {
      return Marker(
        markerId: const MarkerId(""),
        position: LatLng(lat!, lng!),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: const InfoWindow(title: "ສະຖານີຕູ້ສາກ"),
      );
    }

    Set<Marker> mysetmarker() {
      return <Marker>{
        marker1(),
      };
    }

    return Container(
      color: Colors.grey,
      child: lat == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              initialCameraPosition: cameraPosition!,
              mapType: MapType.normal,
              onMapCreated: (controller) {},
              markers: mysetmarker(),
              circles: {
                Circle(
                  circleId: const CircleId(""),
                  center: LatLng(lat!, lng!),
                  radius: lat!,
                  strokeWidth: 1,
                  strokeColor: Colors.blue,
                  fillColor:const Color(0xFF006491).withOpacity(0.2),
                ),
              },
            ),
    );
  }
}
