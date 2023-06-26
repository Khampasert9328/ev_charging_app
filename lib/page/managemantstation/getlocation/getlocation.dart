import 'package:geolocator/geolocator.dart';

class GetLocation{
 static Future<Position> determinePosition() async {
   await Geolocator.requestPermission();
   Position position = await Geolocator.getCurrentPosition(
       desiredAccuracy: LocationAccuracy.high);
   return position;
 }
}