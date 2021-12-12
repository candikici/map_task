import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:map_task/services/map/map_service.dart';
import 'package:map_task/services/place/place_service.dart';

class AppViewModel extends ChangeNotifier {
  final MapService mapService;
  final PlaceService placeService;

  AppViewModel({required this.mapService, required this.placeService});

  double queryWidth =
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;

  double queryHeight =
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;

  dynamic placeResults;
  dynamic locationData;
  String? searchKey;
  int currentPhotoIndex = 0;
  setSearchKey(String key) {
    if (searchKey == key) return;
    searchKey = key;
    notifyListeners();
  }

  clearAllResults() {
    placeResults == null;
    locationData = null;
    searchKey = null;
    notifyListeners();
  }

  setImageIndex(int i, [bool isListening = true]) {
    currentPhotoIndex = i;
    if (isListening) notifyListeners();
  }

  getPlaces(String searchKey) async {
    var returnType = await placeService.findPlaces(searchKey);
    if (returnType is TextSearchResponse) {
      returnType = returnType.results;
    }
    placeResults = returnType;
    notifyListeners();
  }

  getLocationData(String address, String name) async {
    locationData = await mapService.findPlaceOnMap(address, name);
    notifyListeners();
  }
}
