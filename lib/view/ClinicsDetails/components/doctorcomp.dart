import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class Doctorcomp extends StatelessWidget {
  String name;
  String specilist;
  String image;

  Doctorcomp(
      {super.key,
      required this.name,
      required this.image,
      required this.specilist});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: customTextRegular(
            title: name,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.blackb1),
        subtitle: customTextRegular(
            title: specilist,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.cardcolor),
        leading: CircleAvatar(
          backgroundImage: AssetImage(image),
        ),
        // trailing: IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.add,
        //     size: 20.sp,
        //     color: AppColors.purplep1,
        //   ),
        //),
      ),
    );
  }
}
