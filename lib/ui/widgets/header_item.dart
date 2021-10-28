import 'package:flutter/material.dart';

class HeaderItem extends StatelessWidget {
  const HeaderItem({this.title, Key? key}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            title!,
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
