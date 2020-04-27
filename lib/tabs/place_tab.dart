import 'package:flutter/material.dart';
import 'package:lojavirtual_mobile/models/place.model.dart';
import 'package:lojavirtual_mobile/services/place.service.dart';
import 'package:lojavirtual_mobile/widgets/place_tile.dart';

class PlaceTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PlaceModel>>(
      future: PlaceService.getPlaces(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 200.0,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor)),
          );
        }

        var dividedTiles = ListTile.divideTiles(
          tiles: snapshot.data.map((place) => PlaceTile(place)).toList(),
          color: Colors.grey[500],
        ).toList();

        return ListView(children: dividedTiles);
      },
    );
  }
}
