import 'package:flutter/material.dart';
import 'package:flutter_map_app/models/location.dart';

class CardHeader extends StatelessWidget {
  const CardHeader(this.location, {Key? key}) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(25)),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                location.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(location.description),
              const SizedBox(
                height: 4,
              ),
              Text(
                location.phone,
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        const Icon(
          Icons.location_pin,
          color: Colors.red,
          size: 40,
        )
      ],
    );
  }
}
