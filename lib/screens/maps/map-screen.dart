import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:vogu/screens/specialists/service-schedule.dart';
import 'package:vogu/util/credentials.dart';
import 'package:vogu/util/default_colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key key}) : super(key: key);

  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double latitude;
  double longitude;
  String address;

  _setLatLng(double lat, lng) async {
    latitude = lat;
    longitude = lng;

    List<Placemark> addressList =
        await Geolocator().placemarkFromCoordinates(latitude, longitude);
    if (addressList != null && addressList.length > 0) {
      Placemark address = addressList[0];
      var administrativeArea = address.administrativeArea;
      var subAdministrativeArea = address.subAdministrativeArea;
      if (subAdministrativeArea != '') {
        this.address = '$subAdministrativeArea, Moçambique';
      } else {
        this.address = '$administrativeArea, Moçambique';
      }
    }

    print(this.address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlacePicker(
        apiKey: PLACES_KEY,
        initialPosition: MapScreen.kInitialPosition,
        useCurrentLocation: true,
        hintText: "Onde quer ser atendido?",
        searchingText: "A carregar...",
        autoCompleteDebounceInMilliseconds: 500,
//      usePlaceDetailSearch: true,
//      onPlacePicked: (PickResult result) {
//        Navigator.of(context).pop();
//        setState(() {
//          selectedPlace = result;
//        });
//      },
        autocompleteLanguage: "pt",
//          strictbounds: true,
//          region: 'mz',
//          selectInitialPosition: true,
        selectedPlaceWidgetBuilder:
            (_, selectedPlace, state, bool isSearchBarFocused) {
//          print(
//              "state: $state, isSearchBarFocused: $isSearchBarFocused, selectedPlace: ${selectedPlace}");
          print('SELECTED PLACE: ${selectedPlace.toString()}');

          if (selectedPlace != null) {
            _setLatLng(
              selectedPlace.geometry.location.lat,
              selectedPlace.geometry.location.lng,
            );
            print('LATITUDE: $latitude, LONGITUDE: $longitude');
          }


          return isSearchBarFocused
              ? Container()
              : FloatingCard(
                  bottomPosition: 20.0,
                  leftPosition: 0.0,
                  rightPosition: 0.0,
                  color: PURPLE_DEEP.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12.0),
                  child: state == SearchingState.Searching
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(PURPLE_ACCENT),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                '${selectedPlace.formattedAddress}',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey.shade300,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              RaisedButton(
                                child: Text(
                                  "Selecionar aqui",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                elevation: 0.1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                                color: PURPLE_ACCENT,
                                textColor: Colors.grey.shade300,
                                onPressed: () {
                                  //TODO: IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
                                  //            this will override default 'Select here' Button.
                                  print(
                                      "do something with [selectedPlace] data");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ServiceSchedule(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                );
        },
        pinBuilder: (context, state) {
          if (state == PinState.Idle) {
            return Icon(
              Icons.location_on,
              size: 60.0,
              color: BLUE,
            );
          } else {
            return Icon(
              Icons.location_on,
              size: 45.0,
              color: PURPLE_DEEP,
            );
          }
        },
      ),
    );
  }
}
