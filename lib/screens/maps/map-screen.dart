import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vogu/util/default_colors.dart';
import 'package:vogu/widgets/white-wave.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PURPLE_DEEP,
      body: ListView(
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height / 2) + 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30.0),
              ),
            ),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30.0),
                  ),
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    myLocationButtonEnabled: true,
                    initialCameraPosition:
                        CameraPosition(target: _center, zoom: 11.0),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 45.0,
                      padding: EdgeInsets.only(left: 20, right: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: PURPLE_DEEP, width: 2.5)
                      ),
                      child: TextField(
                        style: TextStyle(color: PURPLE_DEEP, fontSize: 20.0, fontWeight: FontWeight.bold,),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Onde vai ser atendido...',
                          hintStyle: TextStyle(color: PURPLE_DEEP),
                          suffixIcon: Icon(
                            Icons.search,
                            color: PURPLE_DEEP,
                            size: 28.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 8.0),
                RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  onPressed: () {},
                  child: Text(
                    'Confirmar',
                    style: TextStyle(letterSpacing: 0.5),
                  ),
                  color: PURPLE_ACCENT,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ],
            ),
          ),
//          SizedBox(height: 125, child: WhiteWave()),
          WhiteWave()
        ],
      ),
    );
  }
}
