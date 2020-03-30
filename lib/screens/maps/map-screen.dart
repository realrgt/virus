import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:vogu/util/credentials.dart';
import 'package:vogu/util/default_colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key key}) : super(key: key);

  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  PickResult selectedPlace;

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
      //usePlaceDetailSearch: true,
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
          (_, selectedPlace, state, isSearchBarFocused) {
//        print("state: $state, isSearchBarFocused: $isSearchBarFocused, selectedPlace: ${selectedPlace}");
        print("STATE: $state, isSearchBarFocused: $isSearchBarFocused");
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
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            RaisedButton(
                              child: Text("Selecionar aqui"),
                              elevation: 0.1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              color: PURPLE_ACCENT,
                              textColor: Colors.grey.shade300,
                              onPressed: () {
                                // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
                                //            this will override default 'Select here' Button.
                                print("do something with [selectedPlace] data");
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
              );
      },
      pinBuilder: (context, state) {
        if (state == PinState.Idle) {
          return Icon(Icons.favorite_border);
        } else {
          return Icon(Icons.favorite);
        }
      },
    ));
  }
}
