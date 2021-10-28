import 'package:flutter/material.dart';
import 'package:flutter_map_app/controllers/main_controller.dart';
import 'package:flutter_map_app/models/location_enum.dart';
import 'package:flutter_map_app/ui/widgets/drop_down_item.dart';
import 'package:flutter_map_app/ui/widgets/header_item.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
          const HeaderItem(
            title: "Specify Your Loaction",
          ),
          const CustomDropDownItem(locationType: LocationType.country),
          const CustomDropDownItem(locationType: LocationType.city),
          Consumer<MainController>(
            builder: (context, model, child) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      await model.handleProceedClick(context);
                    },
                    child: model.isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text("Proceed"),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
