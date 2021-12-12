import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:map_task/constants/app_constants.dart';
import 'package:map_task/utility/route.dart';
import 'package:map_task/view/place_detail.dart';
import 'package:map_task/viewmodel/app_viewmodel.dart';

GoogleMap buildMap(AppViewModel vm, BuildContext context, SearchResult place) {
  return GoogleMap(
    myLocationEnabled: false,
    myLocationButtonEnabled: false,
    initialCameraPosition: CameraPosition(target: vm.locationData[0], zoom: 15),
    markers: {
      (vm.locationData[1] as Marker).copyWith(
        onTapParam: () => pushNewPage(
          context: context,
          page: Detail(place: place),
        ),
      )
    },
  );
}

Center buildErrorText(AppViewModel vm) {
  return Center(
    child: Text(
      vm.locationData,
      textAlign: TextAlign.center,
      style: AppContants.W600S14TG,
    ),
  );
}
