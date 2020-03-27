import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vogu/models/booking-spot.dart';
import 'package:vogu/screens/maps/custom-search-delegate.dart';
import 'package:vogu/util/default_colors.dart';
import 'package:vogu/util/img_assets.dart';
import 'package:vogu/widgets/white-wave.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  TextEditingController _txtController =
      TextEditingController(text: "av. paulista, 807");

  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(-25.962503, 32.584142),
  );

  Set<Marker> _markers = {};

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _addLocationListener() {
    var geolocator = Geolocator();
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

    geolocator.getPositionStream(locationOptions).listen((Position position) {
      _showClientMarker(position);

      _cameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 15,
      );

      _moveCamera(_cameraPosition);
    });
  }

  _getLastKnownPosition() async {
    Position position = await Geolocator().getLastKnownPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      if (position != null) {
        _showClientMarker(position);

        _cameraPosition = CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 15,
        );

        _moveCamera(_cameraPosition);
      }
    });
  }

  _moveCamera(CameraPosition cameraPosition) async {
    GoogleMapController googleMapController = await _controller.future;
    googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  _showClientMarker(Position position) async {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;

    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: pixelRatio), LOCATION_ON)
        .then((BitmapDescriptor iconAsset) {
      Marker clientMarker = Marker(
          markerId: MarkerId('client-marker'),
          position: LatLng(position.latitude, position.longitude),
          infoWindow: InfoWindow(
              title: "Client's Position" //TODO: replace it by user's name
              ),
          icon: iconAsset);

      setState(() {
        _markers.add(clientMarker);
      });
    });
  }

  _confirmBookinSpot() async {
    String bookingSpot = _txtController.text;

    if (bookingSpot.isNotEmpty) {
      List<Placemark> adressList =
          await Geolocator().placemarkFromAddress(bookingSpot);

      if (adressList != null && adressList.length > 0) {
        Placemark placeMark = adressList[0];
        BookingSpot spot = BookingSpot();
        spot.city = placeMark.administrativeArea;
        spot.postalCode = placeMark.postalCode;
        spot.neighbourhood = placeMark.subLocality;
        spot.road = placeMark.thoroughfare;
        spot.number = placeMark.subThoroughfare;

        spot.latitude = placeMark.position.latitude;
        spot.longitude = placeMark.position.longitude;

        String addressConfirm;
        addressConfirm = "\n Cidade: " + spot.city;
        addressConfirm += "\n Rua: " + spot.road + ", " + spot.number;
        addressConfirm += "\n Bairro: " + spot.number;
        addressConfirm += "\n Código Postal: " + spot.postalCode;

        showDialog(
            context: context,
            builder: (contex) {
              return AlertDialog(
                title: Text("Confirmação do endereço"),
                content: Text(addressConfirm),
                contentPadding: EdgeInsets.all(16),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () => Navigator.pop(contex),
                  ),
                  FlatButton(
                    child: Text(
                      "Confirmar",
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () {
                      //salvar requisicao
                      //_salvarRequisicao();

                      Navigator.pop(contex);
                    },
                  )
                ],
              );
            });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getLastKnownPosition();
    _addLocationListener();
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
                    mapType: MapType.normal,
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: _cameraPosition,
//                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    markers: _markers,
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
                          border: Border.all(color: PURPLE_ACCENT, width: 2.5)),
                      child: TextField(
                        controller: _txtController,
                        style: TextStyle(
                          color: PINK,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Onde vai ser atendido...',
                          hintStyle: TextStyle(color: PURPLE_DEEP),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: PURPLE_DEEP,
                              size: 28.0,
                            ),
                            onPressed: () async {
                              String res = await showSearch(context: context, delegate: CustomSearchDelegate());
                              print("resultado: digitado " + res );
                              print('YOU CLICKED ME');
                            },
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
                  onPressed: _confirmBookinSpot,
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
