import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotel_booking/Livechat/view/charroom.dart';
import 'package:hotel_booking/constant.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../loading/loading.dart';
import '../hotel.dart';
import 'package:http/http.dart' as http;

class Dhaka extends StatefulWidget {
  final String cityname;
  const Dhaka({Key? key, this.cityname = "Dhaka"}) : super(key: key);

  @override
  _DhakaState createState() => _DhakaState();
}

class _DhakaState extends State<Dhaka> {
  @override
  void initState() {
    super.initState();
    // getWishListApi(widget.cityname).then((value) {
    //   print(value);
    // });
    getWishListApi(widget.cityname);
  }

  // ignore: prefer_final_fields
  Completer<GoogleMapController> _controller = Completer();
  final MapType _currentMapType = MapType.normal;
  static const LatLng _center = LatLng(40.397419, -74.382103);
  final Set<Marker> _markers = {};

  void _onCameraMove(CameraPosition position) {}

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  //! http://192.168.85.111:9080//city/{city}

  Future<List<dynamic>> getWishListApi(String nameCity) async {
    var url = Uri.parse('http://192.168.85.111:9080//city/$nameCity');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> hotels = json.decode(response.body);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return hotels;
    } else {
      // Handle error or return empty list
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ChatRoom().launch(context);
        },
        child: const Icon(Icons.add),
        backgroundColor: kMainColor,
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.cityname,
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
        iconTheme: const IconThemeData(color: kTitleColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: const Color(0xFFECF3EE),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 40.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search_outlined,
                      color: kTitleColor,
                    ),
                    Text(
                      'Search',
                      style: kTextStyle.copyWith(color: kGreyTextColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
          //! draggablesheet
          DraggableScrollableSheet(
            initialChildSize: 0.30,
            maxChildSize: 1.0,
            minChildSize: 0.15,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                height: 400.0,
                decoration: const BoxDecoration(
                  color: kMainColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      Text(
                        '20 Places to stay',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 18.0),
                      ),
                      const SizedBox(height: 20.0),
                      // Container(
                      //   decoration: const BoxDecoration(
                      //     color: Color(0xFFF7F7F7),
                      //     borderRadius: BorderRadius.only(
                      //       topRight: Radius.circular(30.0),
                      //       topLeft: Radius.circular(30.0),
                      //     ),
                      //   ),
                      //   child: ListView.builder(
                      //     itemCount: 10,
                      //     shrinkWrap: true,
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     itemBuilder: (_, index) {
                      //       return Padding(
                      //         padding: const EdgeInsets.only(
                      //           left: 20.0,
                      //           right: 20.0,
                      //           top: 10.0,
                      //         ),
                      //         child: Container(
                      //           padding: const EdgeInsets.all(10.0),
                      //           width: context.width() / 1.5,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(20.0),
                      //             color: Colors.white,
                      //           ),
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             mainAxisSize: MainAxisSize.min,
                      //             children: [
                      //               Image.asset('images/banner6.png'),
                      //               const SizedBox(height: 10.0),
                      //               Text(
                      //                 'Sandy Hill Beach, West Sonadia',
                      //                 style: kTextStyle.copyWith(
                      //                     color: kTitleColor,
                      //                     fontSize: 18.0,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //               Row(
                      //                 children: [
                      //                   const Icon(
                      //                     Icons.location_on,
                      //                     color: Color(0xFFFF8748),
                      //                     size: 18.0,
                      //                   ),
                      //                   Text(
                      //                     '2,984 kilometres away',
                      //                     style: kTextStyle.copyWith(
                      //                       color: kGreyTextColor,
                      //                     ),
                      //                   ),
                      //                   const Spacer(),
                      //                   Container(
                      //                     decoration: BoxDecoration(
                      //                       borderRadius:
                      //                           BorderRadius.circular(30.0),
                      //                       color: kMainColor,
                      //                     ),
                      //                     child: Padding(
                      //                       padding: const EdgeInsets.all(10.0),
                      //                       child:
                      //                           Image.asset('images/arrow.png'),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ],
                      //           ),
                      //         ).onTap(
                      //           () => const Hotel().launch(context),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),

                      FutureBuilder<List<dynamic>>(
                        future: getWishListApi(widget.cityname),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<dynamic>> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              shrinkWrap: true,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 10,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: ShimmerLoadingContainer(),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            List<dynamic> hotels = snapshot.data ?? [];
                            return ListView.builder(
                              itemCount: hotels.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (_, index) {
                                var hotel = hotels[index];
                                return Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFF7F7F7),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30.0),
                                      topLeft: Radius.circular(30.0),
                                    ),
                                  ),
                                  child: ListView.builder(
                                    itemCount: hotels.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (_, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20.0,
                                          right: 20.0,
                                          top: 10.0,
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.all(10.0),
                                          width: context.width() / 1.5,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset('images/banner6.png'),
                                              const SizedBox(height: 10.0),
                                              Text(
                                                hotel['name'],
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor,
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_on,
                                                    color: Color(0xFFFF8748),
                                                    size: 18.0,
                                                  ),
                                                  // Text(
                                                  //   '2,984 kilometres away',
                                                  //   style: kTextStyle.copyWith(
                                                  //     color: kGreyTextColor,
                                                  //   ),
                                                  // ),
                                                  Text(
                                                    hotel['distance']
                                                            .toString() +
                                                        " KiloMeters away",
                                                    style: kTextStyle.copyWith(
                                                      color: kGreyTextColor,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      color: kMainColor,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Image.asset(
                                                          'images/arrow.png'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ).onTap(
                                          () => const Hotel().launch(context),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
