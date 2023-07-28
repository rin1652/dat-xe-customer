import 'package:datxe/modules/booking_module/booking_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final GoogleMapViewModel googleMapViewModel = Get.put(GoogleMapViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn điểm'),
      ),
      body: GetX<GoogleMapViewModel>(
        builder: (googleMapViewModel) => Stack(
          children: [
            map(viewModel: googleMapViewModel),
            _buttonConfirm(viewModel: googleMapViewModel),
          ],
        ),
      ),
    );
  }

  Widget _buttonConfirm({required GoogleMapViewModel viewModel}) {
    return Positioned(
      bottom: 20,
      right: 40,
      left: 40,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
          onPressed: () {
            if (viewModel.haveLocation.value) {
              viewModel.pickPlace();
            }
          },
          child: const Text('Nhận khách tại đây'),
        ),
      ),
    );
  }

  Widget map({required GoogleMapViewModel viewModel}) {
    return !viewModel.haveLocation.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GoogleMap(
            onTap: (argument) {
              setState(() {
                viewModel.pickedLocation.value = argument;
              });
            },
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                  viewModel.myPlace.value!.lat, viewModel.myPlace.value!.lng),
              zoom: 16,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('m1'),
                position: viewModel.pickedLocation.value ??
                    LatLng(
                      viewModel.myPlace.value!.lat,
                      viewModel.myPlace.value!.lng,
                    ),
              )
            },
          );
  }
}
