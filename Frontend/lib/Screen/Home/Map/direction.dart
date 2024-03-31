import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotel_booking/constant.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
  }


  // ignore: prefer_final_fields
  Completer<GoogleMapController> _controller = Completer();
  MapType _currentMapType = MapType.normal;
  static const LatLng _center = LatLng(40.397419, -74.382103);
  final Set<Marker> _markers = {};

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }


  void _onCameraMove(CameraPosition position) {
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kTitleColor),
        title: Text(
          'Direction',
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: _onMapTypeButtonPressed,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.explore_outlined,
                    size: 36.0,
                    color: Color(0xFFFF8748),
                  ),
                ),
                const SizedBox(height: 30.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 110.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Row(
                   mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('images/room.png'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Classic Flat Room',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 18.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:5.0, left: 5.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Color(0xFFFF8748),
                                  size: 18.0,
                                ),
                                Text(
                                  '2,984 kilometres away',
                                  style: kTextStyle.copyWith(
                                    color: const Color(0xFF595959),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all( 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '\$396',
                                  style: kTextStyle.copyWith(
                                      color: const Color(0xFFFF8748), fontSize: 18.0),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  '/ 4 Night',
                                  style: kTextStyle.copyWith(color: kGreyTextColor),
                                ),
                                const SizedBox(width: 50.0),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: kMainColor,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Icon(
                                      FeatherIcons.heart,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
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
        ],
      ),
    );
  }
}
