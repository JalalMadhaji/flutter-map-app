import 'package:flutter/material.dart';
import 'package:flutter_map_app/ui/screens/register.dart';
import 'package:flutter_map_app/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _name,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: .5),
                  ),
                  label: const Text("User Name"),
                ),
                validator: (value) {
                  if (value == null || value != kLoginKey) {
                    return "Please enter user name correctly!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: .5),
                  ),
                  label: const Text("Password"),
                ),
                validator: (value) {
                  if (value == null || value != kLoginKey) {
                    return "Please enter password correctly!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 2));
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    }
                  },
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text("Login"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
