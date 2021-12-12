import 'package:flutter/material.dart';
import 'package:map_task/constants/app_constants.dart';
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: AppContants.BLUE,
            centerTitle: true,
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: AppContants.BLUE),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: AppContants.W600S14TG,
            hintStyle: AppContants.W600S14TG,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                style: BorderStyle.solid,
                color: AppContants.BLUE,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 2,
                color: AppContants.BLUE,
              ),
            ),
          ),
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: AppContants.BLUE),
        ),
        title: 'Map Challenge',
        home: const Search(),
      ),
    );
  }
}
