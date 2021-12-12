import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:map_task/components/main_components.dart';
import 'package:map_task/components/search_cmp.dart';

import 'package:map_task/viewmodel/app_viewmodel.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isLoading = false;
  changeLoading() => setState(() => isLoading = !isLoading);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Map Challenge"),
      body: Consumer<AppViewModel>(
        builder: (context, vm, child) => Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                    hintText: "Search", labelText: "Search"),
                onChanged: (searchKey) async => onChanged(vm, searchKey),
              ),
              if (vm.placeResults != null &&
                  vm.placeResults is List<SearchResult>)
                const SizedBox(height: 20),
              if (isLoading)
                const Flexible(
                    child: Center(child: CircularProgressIndicator())),
              if (vm.placeResults != null &&
                  vm.placeResults is List<SearchResult> &&
                  !isLoading)
                buildExpandedList(vm),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onChanged(AppViewModel vm, String searchKey) async {
    changeLoading();
    await vm.getPlaces(searchKey);
    changeLoading();
  }
}
