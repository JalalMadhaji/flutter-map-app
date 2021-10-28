import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_app/models/city.dart';
import 'package:flutter_map_app/models/country.dart';
import 'package:flutter_map_app/ui/screens/map.dart';
import 'package:flutter_map_app/ui/screens/register.dart';

class MainController with ChangeNotifier {
  bool _isLoading = false;
  Country? _currentCountry;
  City? _currentCity;

  bool get isLoading {
    return _isLoading;
  }

  Country? get currentCountry {
    return _currentCountry;
  }

  City? get currentCity {
    return _currentCity;
  }

  void setLoading(bool status) {
    _isLoading = status;
    notifyListeners();
  }

  void setCurrentCountry(Country country) {
    _currentCountry = country;
  }

  void setCurrentCity(City? city) {
    _currentCity = city;
  }

  Future<void> handleLoginClick(bool validated, BuildContext context) async {
    if (validated) {
      setLoading(true);
      await Future.delayed(const Duration(seconds: 2));
      setLoading(false);
      Navigator.pushNamed(context, RegisterPage.route);
    }
  }

  void handleCountryDropDownChange(Country country) {
    setCurrentCity(null);
    setCurrentCountry(country);
    notifyListeners();
  }

  void handleCityDropDownChange(City city) {
    setCurrentCity(city);
    notifyListeners();
  }

  Future<void> handleProceedClick(BuildContext context) async {
    if (currentCountry != null && currentCity != null) {
      setLoading(true);
      await Future.delayed(const Duration(seconds: 2));
      setLoading(false);
      Navigator.pushNamed(context, MapPage.route);
    } else {
      const snackbar = SnackBar(content: Text("Choose Location First"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}
