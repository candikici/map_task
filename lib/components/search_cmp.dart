import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:map_task/constants/app_constants.dart';
import 'package:map_task/utility/route.dart';
import 'package:map_task/viewmodel/app_viewmodel.dart';
import 'package:map_task/view/map.dart';

Expanded buildExpandedList(AppViewModel vm) {
  return Expanded(
    child: vm.placeResults.isEmpty
        ? const Center(child: Text("No result found."))
        : ListView.builder(
            itemCount: vm.placeResults.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int i) {
              return buildListTile(context, vm, i);
            },
          ),
  );
}

ListTile buildListTile(BuildContext context, AppViewModel vm, int i) {
  return ListTile(
    onTap: () => pushNewPage(
      context: context,
      page: Map(place: vm.placeResults[i]),
    ),
    leading: buildLeadingWidget(vm, i),
    title: buildTitleWidget(vm, i),
  );
}

Text buildTitleWidget(AppViewModel vm, int i) {
  return Text(
    (vm.placeResults[i] as SearchResult).name ?? "-",
    style: AppContants.W600S14B,
  );
}

Widget buildLeadingWidget(AppViewModel vm, int i) {
  return (vm.placeResults[i] as SearchResult).icon == null
      ? const Icon(Icons.location_history, size: 30)
      : Image.network(
          (vm.placeResults[i] as SearchResult).icon!,
          height: 30,
          width: 30,
        );
}
