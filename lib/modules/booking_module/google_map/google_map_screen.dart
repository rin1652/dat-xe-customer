import 'package:datxe/modules/booking_module/booking_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GoogleMapViewModel vm = Get.put(GoogleMapViewModel());
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(40.714224, -73.961452),
          zoom: 16,
        ),
        // markers: {
        //   Marker(
        //     markerId: const MarkerId('m1'),
        //     position: LatLng(1.0, 1.0),
        //   )
        // },
      ),
    );
  }
}
