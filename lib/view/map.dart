import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:map_task/utility/route.dart';
import 'package:map_task/view/place_detail.dart';
import 'package:map_task/viewmodel/app_viewmodel.dart';
import 'package:provider/provider.dart';

class Map extends StatefulWidget {
  const Map({Key? key, required this.place}) : super(key: key);
  final SearchResult place;
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  bool isLoading = false;
  changeLoading() => setState(() => isLoading = !isLoading);
  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize() async {
    changeLoading();
    var app = Provider.of<AppViewModel>(context, listen: false);
    await app.getLocationData(
        widget.place.formattedAddress!, widget.place.name!);
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place.name ?? ""),
      ),
      body: Consumer<AppViewModel>(
          builder: (context, vm, child) => isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.amber,
                ))
              : vm.locationData is String
                  ? Text(vm.locationData)
                  : GoogleMap(
                      myLocationEnabled: false,
                      myLocationButtonEnabled: false,
                      initialCameraPosition:
                          CameraPosition(target: vm.locationData[0], zoom: 15),
                      markers: {
                        (vm.locationData[1] as Marker).copyWith(
                          onTapParam: () => Navigator.push(
                            context,
                            createRoute(
                              Detail(place: widget.place),
                            ),
                          ),
                        )
                      },
                    )),
    );
  }
}
