import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PostosPage extends StatefulWidget {
  @override
  _PostosPageState createState() => _PostosPageState();
}

class _PostosPageState extends State<PostosPage> {
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(-23.5489, -46.6388),
                tilt: 30,
                zoom: 17,
              ),
              onMapCreated: _onMapCreated,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: mapController == null
                    ? null
                    : () {
                  mapController
                      .animateCamera(CameraUpdate.newCameraPosition(
                    const CameraPosition(
                      target: LatLng(-23.6365, -46.6452),
                      tilt: 30,
                      zoom: 18,
                    ),
                  ));
                },
                mini: true,
                child: Icon(
                  Icons.my_location,
                  color: Colors.black54,
                ),
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
}