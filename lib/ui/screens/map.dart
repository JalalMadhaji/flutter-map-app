import 'package:flutter/material.dart';
import 'package:flutter_map_app/models/location.dart';
import 'package:flutter_map_app/ui/widgets/card_row.dart';
import 'package:flutter_map_app/ui/widgets/location_card_header.dart';
import 'package:flutter_map_app/utils/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const double cardVisiblePosition = 20;
const double cardInvisiblePosition = -300;
double cardPosition = cardInvisiblePosition;

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  // Current user location
  final LatLng _center = const LatLng(15.32038658843525, 44.198834939803895);
  Location currentLocation = kLocationsList.first;

  // iteriate in static locations and gerenerate a list of markers
  List<Marker> _getLocations() {
    List<Marker> markers = <Marker>[];
    for (int i = 0; i < kLocationsList.length; i++) {
      markers.add(Marker(
        markerId: MarkerId(kLocationsList[i].title),
        position: LatLng(kLocationsList[i].lat, kLocationsList[i].long),
        infoWindow: InfoWindow(title: kLocationsList[i].title),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        onTap: () {
          setState(() {
            currentLocation = kLocationsList[i];
            cardPosition = cardVisiblePosition;
          });
        },
      ));
    }
    return markers;
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    setState(() {
      cardPosition = cardInvisiblePosition;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Gardens'),
        backgroundColor: Colors.green[700],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              markers: Set<Marker>.of(_getLocations()),
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              onTap: (LatLng loc) {
                setState(() {
                  cardPosition = cardInvisiblePosition;
                });
              },
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            bottom: cardPosition,
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
                  CardHeader(currentLocation),
                  const SizedBox(
                    height: 16,
                  ),
                  CardRow("Ages", currentLocation.ageAverage),
                  const SizedBox(
                    height: 16,
                  ),
                  CardRow("Work Days", currentLocation.workDays),
                  const SizedBox(
                    height: 16,
                  ),
                  CardRow("Daily Hours", currentLocation.dailyHours),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
