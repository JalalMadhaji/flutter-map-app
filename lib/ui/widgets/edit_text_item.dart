import 'package:flutter/material.dart';
import 'package:flutter_map_app/utils/constants.dart';

class CustomEditText extends StatefulWidget {
  const CustomEditText(
      {this.controller, this.placeholder, this.isObscureText, Key? key})
      : super(key: key);

  final TextEditingController? controller;
  final String? placeholder;
  final bool? isObscureText;

  @override
  _CustomEditTextState createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isObscureText!,
        decoration: InputDecoration(
          prefixIcon: widget.isObscureText!
              ? const Icon(Icons.password)
              : const Icon(Icons.person),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.black, width: .5),
          ),
          label: Text(widget.placeholder!),
        ),
        validator: (value) {
          if (value == null || value != kLoginKey) {
            return "Please enter ${widget.placeholder!} correctly!";
          }
          return null;
        },
      ),
    );
  }
}
