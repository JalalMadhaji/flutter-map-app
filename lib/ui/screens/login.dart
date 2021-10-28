import 'package:flutter/material.dart';
import 'package:flutter_map_app/controllers/main_controller.dart';
import 'package:flutter_map_app/ui/widgets/edit_text_item.dart';
import 'package:flutter_map_app/ui/widgets/header_item.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String route = "/";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeaderItem(
              title: "Login",
            ),
            CustomEditText(
              controller: _name,
              isObscureText: false,
              placeholder: "User Name",
            ),
            CustomEditText(
              controller: _password,
              isObscureText: true,
              placeholder: "Password",
            ),
            Consumer<MainController>(
              builder: (context, model, child) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        await model.handleLoginClick(
                            _formKey.currentState!.validate(), context);
                      },
                      child: model.isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text("Login"),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
