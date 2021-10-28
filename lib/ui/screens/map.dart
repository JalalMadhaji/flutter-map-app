import 'package:flutter/material.dart';
import 'package:flutter_map_app/controllers/map_controller.dart';
import 'package:flutter_map_app/ui/widgets/card_row.dart';
import 'package:flutter_map_app/ui/widgets/location_card_header.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  static const String route = "/map";

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Gardens'),
        backgroundColor: Colors.green[700],
      ),
      body: Consumer<MapController>(
        builder: (context, model, child) {
          return WillPopScope(
            onWillPop: () async {
              model.handleOnClickInMap();
              return true;
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: GoogleMap(
                    markers: Set<Marker>.of(model.getLocations()),
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: model.currentCoordinates,
                      zoom: 11.0,
                    ),
                    onTap: (LatLng loc) {
                      model.handleOnClickInMap();
                    },
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  bottom: model.cardPosition,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.2),
                            blurRadius: 10,
                            offset: Offset.zero,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CardHeader(model.currentLocation),
                        const SizedBox(
                          height: 16,
                        ),
                        CardRow("Ages", model.currentLocation.ageAverage),
                        const SizedBox(
                          height: 16,
                        ),
                        CardRow("Work Days", model.currentLocation.workDays),
                        const SizedBox(
                          height: 16,
                        ),
                        CardRow(
                            "Daily Hours", model.currentLocation.dailyHours),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
