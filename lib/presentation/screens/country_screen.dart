import 'dart:ui';

import 'package:app_with_api/domain/entity/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CountryScreen extends StatelessWidget {
  final Country country;

  const CountryScreen({required this.country, Key? key}) : super(key: key);

  double _getZoom(num area) {
    const minSize = 400;
    const maxSize = 17124442;
    print(9.5 + (area.clamp(minSize, maxSize) - minSize) / (maxSize - minSize) * (1 - 9.5));
    return 9.5 + (area.clamp(minSize, maxSize) - minSize) / (maxSize - minSize) * (1 - 9.5);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(country.name),
        ),
        body: Column(
          children: [
            if (country.latlng.isNotEmpty)
              SizedBox(
                height: 250,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(country.latlng.first, country.latlng.last),
                    // center: LatLng(51.5, -0.09),
                    // zoom: country.area != null ? ,
                    // zoom: country.area != null ? _getZoom(country.area!) : 9,
                    zoom: 4.7,
                  ),
                  layers: [
                    TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c']),
                    MarkerLayerOptions(
                      markers: [
                        Marker(
                          width: 80,
                          height: 100,
                          point:
                              LatLng(country.latlng.first, country.latlng.last),
                          builder: (ctx) => Column(
                            children: [
                              const Icon(
                                Icons.location_pin,
                                color: Colors.redAccent,
                              ),
                              Text(
                                country.name.toString(),
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            if (country.area != null) Text(country.area.toString()),
            if (country.area != null) Text(_getZoom(country.area!).toString()),
          ],
        ),
      ),
    );
  }
}
