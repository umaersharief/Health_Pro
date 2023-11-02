import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';

// ignore: must_be_immutable
class Listtilecomp extends StatefulWidget {
  String title, subtitle;
  Widget trailing;
  Listtilecomp({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.trailing,
  }) : super(key: key);

  @override
  State<Listtilecomp> createState() => _ListtilecompState();
}

class _ListtilecompState extends State<Listtilecomp> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black)),
      subtitle: Text(widget.subtitle,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.cardcolor)),
      trailing: widget.trailing,
    );
  }
}
