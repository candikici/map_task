import 'package:flutter/material.dart';
import 'package:map_task/services/map/map_service.dart';
import 'package:map_task/services/place/place_service.dart';
import 'package:map_task/view/search.dart';
import 'package:map_task/viewmodel/app_viewmodel.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MapChallengeApp());

class MapChallengeApp extends StatelessWidget {
  const MapChallengeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapService _mapService = MapService();
    final PlaceService _placeService = PlaceService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppViewModel(
            mapService: _mapService,
            placeService: _placeService,
          ),
        )
      ],
      child: const MaterialApp(
        title: 'Map Challengr',
        home: Search(),
      ),
    );
  }
}
