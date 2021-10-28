import 'package:flutter/material.dart';
import 'package:flutter_map_app/controllers/main_controller.dart';
import 'package:flutter_map_app/controllers/map_controller.dart';
import 'package:flutter_map_app/ui/screens/login.dart';
import 'package:flutter_map_app/ui/screens/map.dart';
import 'package:flutter_map_app/ui/screens/register.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainController>(create: (_) => MainController()),
        ChangeNotifierProvider<MapController>(create: (_) => MapController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "expo",
          primarySwatch: Colors.green,
        ),
        onGenerateRoute: (RouteSettings routeSettings) {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) {
              switch (routeSettings.name) {
                case RegisterPage.route:
                  return const RegisterPage();
                case MapPage.route:
                  return const MapPage();
                case LoginPage.route:
                default:
                  return const LoginPage();
              }
            },
          );
        },
      ),
    );
  }
}
