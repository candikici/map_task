import 'package:google_place/google_place.dart';
import 'package:map_task/services/place/IPlaceService.dart';

class PlaceService extends IPlaceService {
  static const _key = "AIzaSyBGU-a44_MPItJ2EO1AAd75EbigXT-Hay8";
  final place = GooglePlace(_key);

  @override
  Future findPlaces(String searchKey) async {
    try {
      var response = await place.search.getTextSearch(searchKey);
      return response;
    } catch (e) {
      return "There is an error.";
    }
  }

  @override
  String getPhotoURL(String photoReference) =>
      "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=$photoReference&key=$_key";
}
