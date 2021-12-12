import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import '../components/main_components.dart';
import '../components/map_cmp.dart';
import '../viewmodel/app_viewmodel.dart';
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
      appBar: buildAppBar(title: widget.place.name ?? ""),
      body: Consumer<AppViewModel>(
        builder: (context, vm, child) => isLoading
            ? const Center(child: CircularProgressIndicator())
            : vm.locationData is String
                ? buildErrorText(vm)
                : buildMap(vm, context, widget.place),
      ),
    );
  }
}
