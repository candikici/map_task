import 'package:flutter/material.dart';
import 'package:map_task/services/map/map_service.dart';
import 'package:map_task/services/place/place_service.dart';

class AppViewModel extends ChangeNotifier {
  final MapService mapService;
  final PlaceService placeService;

  AppViewModel({required this.mapService, required this.placeService});
}
