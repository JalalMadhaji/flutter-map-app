import 'package:flutter/material.dart';
import 'package:flutter_map_app/controllers/main_controller.dart';
import 'package:flutter_map_app/models/city.dart';
import 'package:flutter_map_app/models/country.dart';
import 'package:flutter_map_app/models/location_enum.dart';
import 'package:flutter_map_app/utils/constants.dart';
import 'package:provider/provider.dart';

class CustomDropDownItem extends StatefulWidget {
  const CustomDropDownItem({this.locationType, Key? key}) : super(key: key);

  final LocationType? locationType;

  @override
  State<CustomDropDownItem> createState() => _CustomDropDownItemState();
}

class _CustomDropDownItemState extends State<CustomDropDownItem> {
  @override
  Widget build(BuildContext context) {
    MainController controller = Provider.of<MainController>(context);
    String title = widget.locationType == LocationType.country
        ? "Select Country"
        : "Select City";

    List<DropdownMenuItem<dynamic>> getItems() {
      if (widget.locationType == LocationType.city) {
        return controller.currentCountry != null
            ? kCities.map((e) {
                return DropdownMenuItem<City>(
                  value: e,
                  child: Text(e.title),
                );
              }).where((element) {
                return element.value?.countryId ==
                    controller.currentCountry?.id;
              }).toList()
            : [];
      } else {
        return kCountries.map((e) {
          return DropdownMenuItem<Country>(
            value: e,
            child: Text(e.title),
          );
        }).toList();
      }
    }

    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.5),
          borderRadius: BorderRadius.circular(5.0)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          hint: Text(title),
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          isExpanded: true,
          value: widget.locationType == LocationType.country
              ? controller.currentCountry
              : controller.currentCity,
          onChanged: (value) {
            widget.locationType == LocationType.country
                ? controller.handleCountryDropDownChange(value)
                : controller.handleCityDropDownChange(value);
          },
          items: getItems(),
        ),
      ),
    );
  }
}
