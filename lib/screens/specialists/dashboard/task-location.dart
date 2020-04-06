import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vogu/models/specialist.dart';
import 'package:vogu/util/default_colors.dart';

class TaskLocation extends StatefulWidget {
  @override
  _TaskLocationState createState() => _TaskLocationState();
}

class _TaskLocationState extends State<TaskLocation> {

  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _markers = {};

  double _latitude;
  double _longitude;
  ///-25.971210, 32.587494

  _showMarker() {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: pixelRatio),
      'assets/images/location_on.png',
    ).then(
      (BitmapDescriptor icon) {
        Marker marker = Marker(
          markerId: MarkerId('local-cliente'),
          position: LatLng(_latitude, _longitude),
          infoWindow: InfoWindow(title: 'Endereço Cliente'),
          icon: icon,
        );
        setState(() {
          _markers.add(marker);
        });
      },
    );
  }

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    //TODO: use locations from fireBase
    setState(() {
      _latitude = -25.971210;
      _longitude = 32.587494;
    });

    _showMarker();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(target: LatLng(_latitude, _longitude), zoom: 15.0),
            onMapCreated: _onMapCreated,
            myLocationButtonEnabled: false,
            markers: _markers,
          ),
          Positioned(
            bottom: 0.0,
            left: 0,
            right: 0,
            child: Container(
              height: 205.0,
              decoration: BoxDecoration(
                color: Colors.grey[300].withOpacity(0.3),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    height: 123.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  specialists[1].imgUrl,
                                  width: 80.0,
                                  height: 80.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 3.0),
                                        Text(
                                          specialists[1].name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.0),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.location_on,
                                          size: 18.0,
                                        ),
                                        Text(
                                          specialists[1].address,
                                          style: TextStyle(
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            SizedBox(width: 3.0),
                                            Icon(
                                              Icons.access_time,
                                              size: 15.0,
                                            ),
                                            SizedBox(width: 5.0),
                                            Text(
                                              '14:00',
                                              style: TextStyle(
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 80.0,
                                padding: EdgeInsets.only(right: 10.0),
                                child: VerticalDivider(
                                  color: Colors.grey[300],
                                  thickness: 1.5,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '01',
                                    style: TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.w700,
                                      color: PURPLE_DEEP,
                                    ),
                                  ),
                                  Text(
                                    'AGO',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w500,
                                      color: PURPLE_DEEP,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 10, vertical: 15.0),
                        onPressed: () {},
                        color: PURPLE_DEEP,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Text(
                          'Vou Atrasar',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ),
                      RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 10, vertical: 15.0),
                        onPressed: () {},
                        color: PURPLE_DEEP,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Text(
                          'Cancelar',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
