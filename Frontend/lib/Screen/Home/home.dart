import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotel_booking/Profile/profile.dart';
import 'package:hotel_booking/Screen/Home/Trips/trips.dart';
import 'package:hotel_booking/Screen/Home/booking_list.dart';
import 'package:hotel_booking/Screen/Home/wish_list.dart';
import '../../constant.dart';
import 'home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    WishList(),
    Trips(),
    BookingList(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeScreen(),
      backgroundColor: const Color(0xFFF7F7F7),
      body: _widgetOptions.elementAt(_currentPage),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGreyTextColor,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        items: const [
          /// Home
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Explore",
          ),

          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidHeart),
            label: "Wishlists",
          ),

          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.send),
            label: "Trips",
          ),

          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.ticketAlt),
            label: "Booking",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        onTap: (int index) {
          setState(() => _currentPage = index);
        },
        currentIndex: _currentPage,
      ),
    );
  }
}
