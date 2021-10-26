import 'package:flutter/material.dart';

class CardRow extends StatelessWidget {
  const CardRow(this.label, this.value, {Key? key}) : super(key: key);

  final String label, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 66,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: TextStyle(color: Colors.black.withOpacity(.8)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
