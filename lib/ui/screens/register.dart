import 'package:flutter/material.dart';
import 'package:flutter_map_app/models/city.dart';
import 'package:flutter_map_app/models/country.dart';
import 'package:flutter_map_app/ui/screens/map.dart';
import 'package:flutter_map_app/utils/constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Country? _currentCountry;
  City? _currentCity;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Choose Location'),
        backgroundColor: Colors.green[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: Text(
                  "Specify Your Loaction",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.5),
                borderRadius: BorderRadius.circular(5.0)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Country>(
                hint: const Text("Select Country"),
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                isExpanded: true,
                value: _currentCountry,
                onChanged: (value) {
                  setState(() {
                    _currentCity = null;
                    _currentCountry = value!;
                  });
                },
                items: kCountries.map((e) {
                  return DropdownMenuItem<Country>(
                    value: e,
                    child: Text(e.title),
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.5),
                borderRadius: BorderRadius.circular(5.0)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<City>(
                hint: const Text("Select City"),
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                isExpanded: true,
                value: _currentCity,
                onChanged: (value) {
                  setState(() {
                    _currentCity = value!;
                  });
                },
                items: _currentCountry != null
                    ? kCities.map((e) {
                        return DropdownMenuItem<City>(
                          value: e,
                          child: Text(e.title),
                        );
                      }).where((element) {
                        return element.value?.countryId == _currentCountry?.id;
                      }).toList()
                    : [],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  if (_currentCountry != null && _currentCity != null) {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(const Duration(seconds: 2));
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MapPage()),
                    );
                  } else {
                    const snackbar =
                        SnackBar(content: Text("Choose Location First"));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                },
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text("Proceed"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
