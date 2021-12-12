import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_task/services/map/IMapService.dart';
import 'package:geocoding/geocoding.dart' as geo;

class MapService extends IMapService {
  @override
  Future findPlaceOnMap(
    String address,
    String name,
  ) async {
    try {
      var locationList = await geo.locationFromAddress(address);
      var position =
          LatLng(locationList.first.latitude, locationList.first.longitude);
      var marker = Marker(
        markerId: MarkerId(address),
        position: position,
        infoWindow: InfoWindow(
          title: name,
        ),
      );
      return [position, marker];
    } catch (e) {
      return e.toString();
    }
  }
}
