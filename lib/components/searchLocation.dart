import 'package:architech/config/constants.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/models/autoCompletePredictionModel.dart';
import 'package:architech/models/placeAutoCompleteResponseModel.dart';
import 'package:architech/services/network_utility.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class SearchLocation extends StatefulWidget{
  SearchLocation({super.key});

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation>{
  List<AutoCompletePredictionModel> placePredictions = [];
  TextEditingController controller = TextEditingController();

  Position? currentLocation;
  String? currentAddress;

  void placeAutoComplete(String query) async{
    Uri uri = Uri.https(
      "maps.googleapis.com",
      "maps/api/place/autocomplete/json",
      {
        "input": query,
        // "radius": 10000,
        "key": google_api_key
      }
    );

    String? response = await NetworkUtility.fetchUrl(uri);

    if(response != null){
      // print(response);
      PlaceAutoCompleteResponseModel result = PlaceAutoCompleteResponseModel.parsedAutoCompleteResult(response);

      if(result.predictions != null){
        setState(() {
          placePredictions = result.predictions!;
        });
      }
    }
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    
    if(!serviceEnabled){
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();

      if(permission == LocationPermission.denied){
        return Future.error('Location permissions are denied.');
      }
    }

    if(permission == LocationPermission.deniedForever){
      return Future.error('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition().then((Position position){
      setState(() => currentLocation = position);

      getAddressFromCoordinates(currentLocation!);
    });
  }

  Future<void> getAddressFromCoordinates(Position position) async{
    try{
      List<Placemark> placemarks = await placemarkFromCoordinates(
        currentLocation!.latitude, 
        currentLocation!.longitude)
        .then((List<Placemark> placemarks){
          Placemark place = placemarks[0];

          setState(() {
            currentAddress = '${place.name}, ${place.thoroughfare}, ${place.postalCode}, ${place.locality}, ${place.administrativeArea}';
            controller.text = currentAddress!;
          });

          return placemarks;
        });
    }catch (error){
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Pickup Location",
                    style: TextStyle(
                      fontSize: regular,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              TextFormField(
                // validator: (value) => validatorFunction(value),
                controller: controller,
                obscureText: false,
                enableSuggestions: false,
                autocorrect: true,
                cursorColor: primaryColour,
                decoration: InputDecoration(
                  hintText: "Where will you pick up your order?",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  focusedBorder:
                      const OutlineInputBorder(borderSide: BorderSide(width: 2)),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(4))),
                onChanged: (value) {
                  placeAutoComplete(value);
                },
                textInputAction: TextInputAction.search,
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ElevatedButton.icon(
            onPressed: (){
              setState(() {
                getCurrentLocation();
              });
              // setState(() {
              //   getCurrentLocation().then((value) =>{
              //     controller.text = value as String
              //   });
              // });
            }, 
            icon: Icon(Icons.location_searching_rounded),
            label: const Text("Use Current Location"),
            style: ElevatedButton.styleFrom(
              backgroundColor: lightGrey,
              foregroundColor: Colors.black,
              elevation: 0,
              fixedSize: const Size(double.infinity, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              )
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: placePredictions.length,
          itemBuilder: (context, index) => 
          LocationListTile(
            location: placePredictions[index].description!,
            onPressed: (){
              setState(() {
                controller.text = placePredictions[index].description!;
              });
            },
          ),
        ),
      ],
    );
  }
}

class LocationListTile extends StatelessWidget{
  const LocationListTile({super.key, required this.location, required this.onPressed});

  final String location;
  final VoidCallback onPressed;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: lightGrey
        ),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: onPressed,
            horizontalTitleGap: 0,
            leading: Icon(Icons.location_on),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                location,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}