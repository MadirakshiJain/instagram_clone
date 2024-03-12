import 'package:flutter/material.dart';

class LocationPermissionHandler extends StatefulWidget {
  const LocationPermissionHandler({super.key});

  @override
  State<LocationPermissionHandler> createState() =>
      LocationPermissionHandlerState();
}

class LocationPermissionHandlerState extends State<LocationPermissionHandler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Kindly grant permission to access your location in order to fully enjoy the features",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              //  ElevatedButton(onPressed: onPressed, child: child)
            ],
          ),
        ),
      ),
    );
  }
}
