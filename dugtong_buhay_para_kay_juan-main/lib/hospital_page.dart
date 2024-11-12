import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class HospitalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Implement back navigation logic here
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Implement menu action logic here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'NEARBY HOSPITALS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Expanded(
            //   child: GoogleMap(
            //     initialCameraPosition: CameraPosition(
            //       target: LatLng(14.6760, 120.9822), // Replace with desired initial position
            //       zoom: 15.0,
            //     ),
            //     markers: Set<Marker>.of([
            //       Marker(
            //         markerId: MarkerId('Hospital1'),
            //         position: LatLng(14.6760, 120.9822), // Replace with actual hospital coordinates
            //         infoWindow: InfoWindow(
            //           title: 'Hospital 1',
            //           snippet: 'Address: ...',
            //         ),
            //       ),
            //       // Add more markers for other hospitals
            //     ]),
            //   ),
            // ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement search action here
              },
              child: Text('SEARCH'),
            ),
          ],
        ),
      ),
    );
  }
}