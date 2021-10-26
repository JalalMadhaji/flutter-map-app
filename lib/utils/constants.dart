import 'package:flutter_map_app/models/city.dart';
import 'package:flutter_map_app/models/country.dart';
import 'package:flutter_map_app/models/location.dart';

const String kLoginKey = "admin";

List<Country> kCountries = [
  Country(1, "Yemen"),
  Country(2, "Saudi Arabia"),
];

List<City> kCities = [
  City(1, "Sanaa", 1),
  City(2, "Riyadh", 2),
];

List<Location> kLocationsList = [
  Location(
      1,
      15.324745501266712,
      44.1995208711191,
      "Garden One",
      "Description One",
      "777-888-999",
      "3-5 Years",
      "Sun - Wed",
      "08:00 - 16:00"),
  Location(
      2,
      15.334854628923223,
      44.206430497325954,
      "Garden Two",
      "Description Two",
      "777-111-232",
      "2-6 Years",
      "Sun - Thu",
      "08:30 - 16:30"),
  Location(
      3,
      15.319789066416133,
      44.18033796717854,
      "Garden Three",
      "Description Three",
      "777-232-555",
      "2-4 Years",
      "Sun - Wed",
      "09:00 - 17:00"),
  Location(
      4,
      15.331543609382136,
      44.223081651433176,
      "Garden Four",
      "Description Four",
      "777-449-111",
      "3-6 Years",
      "Sat - Thu",
      "09:00 - 13:30"),
  Location(
      5,
      15.335847924554669,
      44.17312818911149,
      "Garden Five",
      "Description Five",
      "777-876-096",
      "1-5 Years",
      "Sat - Wed",
      "08:00 - 16:15"),
  Location(
      6,
      15.32641142542669,
      44.1727848663464,
      "Garden Six",
      "Description Six",
      "777-009-842",
      "3-5 Years",
      "Sat - Thu",
      "09:00 - 16:45"),
];
