import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_pro/view/widgets/widgets/custom_appbars.dart';
import 'components/notificationcomp1.dart';

// ignore: must_be_immutable
class Notificationscreen extends StatelessWidget {
  Notificationscreen({super.key});
  List<Notificationscomp1> notifications = [
    Notificationscomp1(
      title: 'You Better to be ready! your appointment is 10 am',
      icon: CupertinoIcons.person_fill,
    ),
    Notificationscomp1(
      title: 'Dont forget to eat before',
      icon: CupertinoIcons.bell_fill,
    ),
    Notificationscomp1(
      title: 'Hey Bro check you temp 14F',
      icon: CupertinoIcons.person_fill,
    ),
    Notificationscomp1(
      title: 'You Better to be ready! your appointment is 10 am',
      icon: CupertinoIcons.person_fill,
    ),
    Notificationscomp1(
      title: 'Subscribe Maha Plan',
      icon: CupertinoIcons.bell_fill,
    ),
    Notificationscomp1(
      title: 'New Card services is available',
      icon: CupertinoIcons.person_fill,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleappbar(text: 'Notification', isicon: false),
        body: Container(
          margin: EdgeInsets.only(top: 16),
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) => notifications[index],
          ),
        ));
  }
}
