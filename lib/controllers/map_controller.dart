import 'package:flutter/cupertino.dart';
import 'package:flutter_map_app/models/location.dart';
import 'package:flutter_map_app/utils/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController with ChangeNotifier {
  final LatLng _currentCoordinates =
      const LatLng(15.32038658843525, 44.198834939803895);
  Location _currentLocation = kLocationsList.first;
  final double cardVisiblePosition = 20;
  final double cardInvisiblePosition = -300;
  double cardPosition = -300;

  LatLng get currentCoordinates {
    return _currentCoordinates;
  }

  void setCardPosition(double position) {
    cardPosition = position;
  }

  Location get currentLocation {
    return _currentLocation;
  }

  void setCurrentLocation(Location location) {
    _currentLocation = location;
  }

  void handleOnClickInMap() {
    setCardPosition(cardInvisiblePosition);
    notifyListeners();
  }

  List<Marker> getLocations() {
    List<Marker> markers = <Marker>[];
    for (int i = 0; i < kLocationsList.length; i++) {
      markers.add(Marker(
        markerId: MarkerId(kLocationsList[i].title),
        position: LatLng(kLocationsList[i].lat, kLocationsList[i].long),
        infoWindow: InfoWindow(title: kLocationsList[i].title),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        onTap: () {
          setCurrentLocation(kLocationsList[i]);
          setCardPosition(cardVisiblePosition);
          notifyListeners();
        },
      ));
    }
    return markers;
  }
}
