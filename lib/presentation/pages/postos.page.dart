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
        title: Text('Abastecimento'),
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
            padding: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.my_location,
                  color: Colors.black54,
                ),
                onPressed: () => {
                  mapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: LatLng(-23.6365, -46.6452),
                        tilt: 30,
                        zoom: 18,
                      )
                    ),
                  ),
                },
              ),
            ),
          )
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