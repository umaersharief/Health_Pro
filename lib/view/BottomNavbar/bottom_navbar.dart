import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/Homepage/View/homepage.dart';
import 'package:health_pro/view/Notification/notification.dart';
import 'package:health_pro/view/Profile/profile.dart';
import 'package:health_pro/view/Search/search.dart';

class BottomNavbar extends StatefulWidget {
  int? setIndex;

  BottomNavbar(this.setIndex, {super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int activeindex = 0;
  List pages = [
    const HomeScreen(),
    Searchscreen(),
    // Notificationscreen(),
    const Profilescreen(),
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.setIndex!=null){
      changepage(widget.setIndex??0);
    }
  }

  void changepage(int index) {
    activeindex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dividercolor,
      body: pages[activeindex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                spreadRadius: 0,
                blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: BottomNavigationBar(
            currentIndex: activeindex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 20.sp,
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard_outlined,
                  size: 20.sp,
                ),
                label: 'Providers',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(
              //     CupertinoIcons.bell,
              //     size: 20.sp,
              //   ),
              //   label: 'Notification',
              // ),q
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 20.sp,
                ),
                label: 'Profile',
              ),
            ],
            onTap: (value) {
              changepage(value);
            },
            selectedItemColor: AppColors.cardcolor,
            unselectedItemColor: Color(0xff888888),
            showUnselectedLabels: true,
            unselectedLabelStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff7B7B7B),
            ),
            selectedLabelStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.cardcolor,
            ),
          ),
        ),
      ),
    );
  }
}
