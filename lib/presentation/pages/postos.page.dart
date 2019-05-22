import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PostosPage extends StatefulWidget {
  @override
  _PostosPageState createState() => _PostosPageState();
}

class _PostosPageState extends State<PostosPage> {
  GoogleMapController mapController;
  final Set<Marker> _markers = {};
  static const LatLng _center = const LatLng(-23.5489, -46.6388);

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;

      _onAddMarker();
    });
  }

  void _onAddMarker() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_center.toString()),
        position: _center,
        // icon: BitmapDescriptor.fromAsset('assets/inventlogo211.png'),
        icon: BitmapDescriptor.defaultMarker,
        onTap: () => _settingModalBottomSheet(context)
      ));
    });
  }

  void _settingModalBottomSheet(context){
    showModalBottomSheet(
      context: context,
      builder: (builder){
        return new Container(
          height: 250,
          color: Colors.transparent,
          child: new Container(
            decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(20.0),
              topRight: const Radius.circular(20.0))
            ),
            padding: EdgeInsets.only(
              top: 30,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Posto Shell',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 5,
                      ),
                      child: Icon(
                        Icons.star_border,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      'Conveniado',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Row(
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 6,
                        color: Colors.white,
                        margin: EdgeInsets.only(
                          right: 10,
                        ),
                        child: Container(
                          height: 70,
                          padding: EdgeInsets.all(15),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  '12.3',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF6200EE),
                                  ),
                                ),
                                Text(
                                  'km',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  right: 3,
                                ),
                                child: Text(
                                  '20',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF6200EE),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                'minutos',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Rodovia Don Pedro, 2211',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            'São Paulo - SP',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      OutlineButton(
                        child: Text(
                          'Informar abastecimento',
                          style: TextStyle(
                            color: Color(0xFF6200EE),
                            fontSize: 14,
                          ),
                        ),
                        onPressed: () => {},
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40))
                      ),
                      OutlineButton(
                        padding: EdgeInsets.all(0),
                        child: Text(
                          'Rota',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                        onPressed: () => {},
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40))
                      )
                    ],
                  ),
                ),
              ],
            )
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Abastecimento'),
      // ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _center,
                tilt: 30,
                zoom: 17,
              ),
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              markers: _markers,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
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
}