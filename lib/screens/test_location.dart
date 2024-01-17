// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:flutter_map/flutter_map.dart';
// // // // // import 'package:latlong2/latlong.dart';
// // // // //
// // // // // void main() {
// // // // //   runApp(MyApp());
// // // // // }
// // // // //
// // // // // class MyApp extends StatelessWidget {
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return MaterialApp(
// // // // //       home: Scaffold(
// // // // //         appBar: AppBar(
// // // // //           title: Text('OpenStreetMap in Flutter'),
// // // // //         ),
// // // // //         body: FlutterMap(
// // // // //           options: MapOptions(
// // // // //             center: LatLng(0, 0), // Initial map center
// // // // //             zoom: 2.0, // Initial zoom level
// // // // //           ),
// // // // //           // layers: [
// // // // //           //
// // // // //           // ],
// // // // //           children: [
// // // // //            coordinateDebugTileBuilder(
// // // // //               urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
// // // // //               subdomains: ['a', 'b', 'c'],
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // // // // import 'package:example/change_settings.dart';
// // // // // // import 'package:example/enable_in_background.dart';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:location/location.dart';
// // // // // // import 'package:url_launcher/url_launcher.dart';
// // // // // //
// // // // // // import 'change_notification.dart';
// // // // // // import 'get_location.dart';
// // // // // // import 'listen_location.dart';
// // // // // // import 'permission_status.dart';
// // // // // // import 'service_enabled.dart';
// // // // // //
// // // // // // const _url = 'https://github.com/Lyokone/flutterlocation';
// // // // // //
// // // // // // void main() => runApp(const MyApp());
// // // // // //
// // // // // // class MyApp extends StatelessWidget {
// // // // // //   const MyApp({super.key});
// // // // // //
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return MaterialApp(
// // // // // //       title: 'Flutter Location',
// // // // // //       theme: ThemeData(
// // // // // //         primarySwatch: Colors.amber,
// // // // // //       ),
// // // // // //       home: const MyHomePage(title: 'Flutter Location Demo'),
// // // // // //     );
// // // // // //   }
// // // // // // }
// // // // // //
// // // // // // class MyHomePage extends StatefulWidget {
// // // // // //   const MyHomePage({super.key, this.title});
// // // // // //   final String? title;
// // // // // //
// // // // // //   @override
// // // // // //   _MyHomePageState createState() => _MyHomePageState();
// // // // // // }
// // // // // //
// // // // // // class _MyHomePageState extends State<MyHomePage> {
// // // // // //   final Location location = Location();
// // // // // //
// // // // // //   Future<void> _showInfoDialog() {
// // // // // //     return showDialog<void>(
// // // // // //       context: context,
// // // // // //       builder: (context) {
// // // // // //         return AlertDialog(
// // // // // //           title: const Text('Demo Application'),
// // // // // //           content: SingleChildScrollView(
// // // // // //             child: ListBody(
// // // // // //               children: <Widget>[
// // // // // //                 const Text('Created by Guillaume Bernos'),
// // // // // //                 InkWell(
// // // // // //                   child: const Text(
// // // // // //                     _url,
// // // // // //                     style: TextStyle(
// // // // // //                       decoration: TextDecoration.underline,
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                   onTap: () => launchUrl(Uri.parse(_url)),
// // // // // //                 ),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ),
// // // // // //           actions: <Widget>[
// // // // // //             TextButton(
// // // // // //               child: const Text('Ok'),
// // // // // //               onPressed: () {
// // // // // //                 Navigator.of(context).pop();
// // // // // //               },
// // // // // //             ),
// // // // // //           ],
// // // // // //         );
// // // // // //       },
// // // // // //     );
// // // // // //   }
// // // // // //
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       appBar: AppBar(
// // // // // //         title: Text(widget.title!),
// // // // // //         actions: <Widget>[
// // // // // //           IconButton(
// // // // // //             icon: const Icon(Icons.info_outline),
// // // // // //             onPressed: _showInfoDialog,
// // // // // //           )
// // // // // //         ],
// // // // // //       ),
// // // // // //       body: SingleChildScrollView(
// // // // // //         child: Container(
// // // // // //           padding: const EdgeInsets.all(32),
// // // // // //           // FIXME: This ignore can be removed when we drop support for Flutter 3.10.
// // // // // //           // ignore: prefer_const_constructors
// // // // // //           child: Column(
// // // // // //             // FIXME: This ignore can be removed when we drop support for Flutter 3.10.
// // // // // //             // ignore: prefer_const_literals_to_create_immutables
// // // // // //             children: [
// // // // // //               const PermissionStatusWidget(),
// // // // // //               const Divider(height: 32),
// // // // // //               const ServiceEnabledWidget(),
// // // // // //               const Divider(height: 32),
// // // // // //               const GetLocationWidget(),
// // // // // //               const Divider(height: 32),
// // // // // //               const ListenLocationWidget(),
// // // // // //               const Divider(height: 32),
// // // // // //               const ChangeSettings(),
// // // // // //               const Divider(height: 32),
// // // // // //               const EnableInBackgroundWidget(),
// // // // // //               const Divider(height: 32),
// // // // // //               const ChangeNotificationWidget()
// // // // // //             ],
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }
// // // // import 'dart:async';
// // // // import 'dart:developer';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:geolocator/geolocator.dart';
// // // //
// // // // import 'package:http/http.dart' as http;
// // // //
// // // //
// // // // class SafeZoneSelectorMap extends StatefulWidget {
// // // //   const SafeZoneSelectorMap({super.key});
// // // //
// // // //   @override
// // // //   State<StatefulWidget> createState() => _SafeZoneSelectorMapState();
// // // // }
// // // //
// // // // class _SafeZoneSelectorMapState extends ConsumerState<SafeZoneSelectorMap> {
// // // //   Position? _currentPosition;
// // // //   final Completer<GoogleMapController> _controller = Completer();
// // // //   LatLng _selectedLocation = const LatLng(0.0, 0.0);
// // // //   double _safeZoneRadius = 30.0; // Set the desired radius for the safe zone
// // // //   final TextEditingController _radiusController = TextEditingController();
// // // //   final String apiToken = AppLink.apiToken;
// // // //   //!============================================
// // // //   String? get userId => ref.read(prefsProvider).getString("id");
// // // //
// // // //   String? get patientId =>
// // // //       ref.read(prefsProvider).getString(KeyStrings.patientIdKey);
// // // //   //!============================================
// // // //
// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _getCurrentLocation();
// // // //   }
// // // //
// // // //   Future<void> _getCurrentLocation() async {
// // // //     if (userId == null || patientId == null) {
// // // //       return Alert.error(context, message: "User Id Or Patient Id Are Null");
// // // //     }
// // // //     log(" USER ID $userId  Patient ID $patientId");
// // // //     try {
// // // //       Position position = await Geolocator.getCurrentPosition(
// // // //         desiredAccuracy: LocationAccuracy.high,
// // // //       );
// // // //
// // // //       // Set the current position and selected location
// // // //       setState(() {
// // // //         _currentPosition = position;
// // // //         _selectedLocation = LatLng(position.latitude, position.longitude);
// // // //       });
// // // //
// // // //       // Check if the map has been created
// // // //       if (_controller.isCompleted) {
// // // //         // Get the controller
// // // //         final GoogleMapController controller = await _controller.future;
// // // //
// // // //         // Animate the camera to the current location
// // // //         controller.animateCamera(CameraUpdate.newLatLngZoom(
// // // //           _selectedLocation,
// // // //           14.0, // Adjust the zoom level as needed
// // // //         ));
// // // //       }
// // // //     } catch (e) {
// // // //       print("Error getting current location: $e");
// // // //     }
// // // //   }
// // // //
// // // //   // Function to update the safe zone radius on the API
// // // //   Future<void> _updateSafeZoneRadius() async {
// // // //     try {
// // // //       final Uri uri = Uri.parse(
// // // //           'https://elderpeopleband.azurewebsites.net/Patients/UpdateBand');
// // // //       final http.MultipartRequest request = http.MultipartRequest('PUT', uri);
// // // //       request.headers['Authorization'] = 'Bearer $apiToken';
// // // //       request.fields['userId'] = userId ?? 1.toString();
// // // //       request.fields['patientId'] = patientId ?? 1.toString();
// // // //       request.fields['SafeZoneLatitude'] =
// // // //           _selectedLocation.latitude.toString();
// // // //       request.fields['SafeZoneLongitude'] =
// // // //           _selectedLocation.longitude.toString();
// // // //       request.fields['Radius'] = _safeZoneRadius.toString();
// // // //
// // // //       final http.Response response =
// // // //           await http.Response.fromStream(await request.send());
// // // //
// // // //       if (response.statusCode == 200) {
// // // //         // Successfully updated safe zone radius on the server
// // // //         print('Safe zone radius updated successfully');
// // // //       } else {
// // // //         // Handle error
// // // //         print(
// // // //             'Failed to update safe zone radius. Status code: ${response.statusCode}');
// // // //       }
// // // //     } catch (e) {
// // // //       // Handle error
// // // //       print('Error: $e');
// // // //     }
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text('Select Safe Zone'),
// // // //         actions: [
// // // //           IconButton(
// // // //             icon: const Icon(Icons.check),
// // // //             onPressed: () {
// // // //               Navigator.pop(context, _selectedLocation);
// // // //             },
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       body: Stack(
// // // //         children: [
// // // //           Positioned.fill(
// // // //             child: Column(
// // // //               children: [
// // // //                 Expanded(
// // // //                   child: GoogleMap(
// // // //                     onMapCreated: (controller) {
// // // //                       _controller.complete(controller);
// // // //                     },
// // // //                     initialCameraPosition: CameraPosition(
// // // //                       target: _selectedLocation,
// // // //                       zoom: 14.0,
// // // //                     ),
// // // //                     zoomControlsEnabled: false, // Disable default zoom controls
// // // //                     onTap: (LatLng latLng) {
// // // //                       setState(() {
// // // //                         _selectedLocation = latLng;
// // // //                       });
// // // //                       print("SafeZone Location selected is: $latLng");
// // // //                     },
// // // //                     markers: _selectedLocation != null
// // // //                         ? {
// // // //                             Marker(
// // // //                               markerId: const MarkerId('selectedLocation'),
// // // //                               position: _selectedLocation,
// // // //                               infoWindow:
// // // //                                   const InfoWindow(title: 'Selected Location'),
// // // //                             ),
// // // //                           }
// // // //                         : {},
// // // //                     circles: {
// // // //                       Circle(
// // // //                         circleId: const CircleId('safeZoneCircle'),
// // // //                         center: _selectedLocation,
// // // //                         radius: _safeZoneRadius,
// // // //                         fillColor: Colors.red.withOpacity(0.3),
// // // //                         strokeColor: Colors.red,
// // // //                         strokeWidth: 2,
// // // //                       ),
// // // //                     },
// // // //                   ),
// // // //                 ),
// // // //                 Padding(
// // // //                   padding: const EdgeInsets.all(8.0),
// // // //                   child: Row(
// // // //                     children: [
// // // //                       Expanded(
// // // //                         child: TextField(
// // // //                           controller: _radiusController,
// // // //                           keyboardType: TextInputType.number,
// // // //                           style: const TextStyle(color: Colors.white),
// // // //                           decoration: const InputDecoration(
// // // //                             labelText: 'Safe Zone Radius (m)',
// // // //                             labelStyle: TextStyle(color: Colors.white),
// // // //                             hintStyle: TextStyle(color: Colors.white),
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                       const SizedBox(width: 16.0),
// // // //                       ElevatedButton(
// // // //                         onPressed: () {
// // // //                           double newRadius =
// // // //                               double.tryParse(_radiusController.text) ?? 0.0;
// // // //                           if (newRadius > 0.0) {
// // // //                             setState(() {
// // // //                               _safeZoneRadius = newRadius;
// // // //                             });
// // // //                             _updateSafeZoneRadius();
// // // //                           } else {
// // // //                             ScaffoldMessenger.of(context).showSnackBar(
// // // //                               const SnackBar(
// // // //                                 content: Text('Please enter a valid radius.'),
// // // //                               ),
// // // //                             );
// // // //                           }
// // // //                         },
// // // //                         child: const Text('Update Radius'),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //           Positioned(
// // // //             right: 12,
// // // //             bottom: context.height * 0.12,
// // // //             child: SafeArea(
// // // //               child: FloatingActionButton(
// // // //                 onPressed: _getCurrentLocation,
// // // //                 tooltip: 'Get Current Location',
// // // //                 child: const Icon(Icons.location_searching),
// // // //               ),
// // // //             ),
// // // //           )
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // import 'package:geolocator/geolocator.dart';
// // //
// // // // Request location permission
// // // Future<void> requestLocationPermission() async {
// // //   LocationPermission permission = await Geolocator.requestPermission();
// // //
// // //   if (permission == LocationPermission.denied) {
// // //     // Handle denied permission
// // //   }
// // // }
// // // // Get user's current location
// // // Future<Position> getUserLocation() async {
// // //   Position position = await Geolocator.getCurrentPosition();
// // //   return position;
// // // }
// // import 'dart:async';
// //
// // import 'package:flutter/material.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // class LocationScreen extends StatefulWidget {
// //   @override
// //   _LocationScreenState createState() => _LocationScreenState();
// // }
// //
// // class _LocationScreenState extends State<LocationScreen> {
// //   String locationText = 'Tap the button to get location';
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Location Demo'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             ElevatedButton(
// //               onPressed: () {
// //                 _openGoogleMaps();
// //               },
// //               child: Text('Open Google Maps'),
// //             ),
// //             SizedBox(height: 20),
// //             Text('Location: $locationText'),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Future<void> _openGoogleMaps() async {
// //     try {
// //       Position position = await Geolocator.getCurrentPosition();
// //
// //       setState(() {
// //         locationText = 'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
// //       });
// //
// //       final GoogleMapController controller = await showGoogleMaps(
// //         context: context,
// //         initialPosition: LatLng(position.latitude, position.longitude),
// //       );
// //
// //       // You can use the controller to interact with the map if needed
// //     } catch (e) {
// //       print('Error getting location: $e');
// //     }
// //   }
// //
// //   Future<GoogleMapController> showGoogleMaps({
// //     required BuildContext context,
// //     required LatLng initialPosition,
// //   }) async {
// //     Completer<GoogleMapController> _controller = Completer();
// //
// //     await showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return Dialog(
// //           child: Container(
// //             height: 300,
// //             width: MediaQuery.of(context).size.width - 40,
// //             child: GoogleMap(
// //               onMapCreated: (GoogleMapController controller) {
// //                 _controller.complete(controller);
// //               },
// //               initialCameraPosition: CameraPosition(
// //                 target: initialPosition,
// //                 zoom: 15,
// //               ),
// //               markers: {
// //                 Marker(
// //                   markerId: MarkerId('userLocation'),
// //                   position: initialPosition,
// //                 ),
// //               },
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //
// //     // return _controller.future;
// //   }
// // }
// //
// // // void main() {
// // //   runApp(MaterialApp(
// // //     home: LocationScreen(),
// // //   ));
// // // }
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class LocationScreen extends StatefulWidget {
//   @override
//   _LocationScreenState createState() => _LocationScreenState();
// }
//
// class _LocationScreenState extends State<LocationScreen> {
//   String locationText = 'Tap the button to select a location';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Location Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 _openMap();
//               },
//               child: Text('Open Map App'),
//             ),
//             SizedBox(height: 20),
//             Text('Location: $locationText'),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _openMap() async {
//     const url = 'https://www.google.com/maps/search/?api=1';
//
//     if (await launchUrl(Uri.parse(url))) {
//       final launched = await launchUrl(Uri.parse(url));
//
//       if (launched) {
//         // Handle the result when the map app is closed
//         // You can get the selected location here if supported by the map app
//         // For simplicity, let's just update the text after a short delay
//         Future.delayed(const Duration(seconds: 5), () {
//           _updateLocationText();
//         });
//       }
//     } else {
//       // Handle the case where the user cannot launch the map app
//     }
//   }
//
//   void _updateLocationText() {
//     setState(() {
//       locationText = 'Selected location: <your latitude>, <your longitude>';
//     });
//   }
// }
