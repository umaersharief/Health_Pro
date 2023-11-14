import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Table(
        border: TableBorder.symmetric(
            inside: BorderSide(
          color: Colors.grey.shade400,
          width: 2,
        )),
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                left: BorderSide(color: Colors.grey.shade400, width: 2),
                right: BorderSide(color: Colors.grey.shade400, width: 2),
                bottom: BorderSide(color: Colors.grey.shade400, width: 2),
              ),
            ),
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(name, textAlign: TextAlign.center),
                ),
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('$specilist%'),
              )),
            ],
          ),
        ],
      ),
    );
    // Card(
    //   elevation: 4,
    //   child: ListTile(
    //     title: customTextRegular(
    //         title: name,
    //         fontSize: 14.sp,
    //         fontWeight: FontWeight.w400,
    //         color: AppColors.blackb1),
    //     subtitle: customTextRegular(
    //         title: specilist,
    //         fontSize: 12.sp,
    //         fontWeight: FontWeight.w400,
    //         color: AppColors.cardcolor),
    //     leading: CircleAvatar(
    //       backgroundImage: AssetImage(image),
    //     ),
    //     // trailing: IconButton(
    //     //   onPressed: () {},
    //     //   icon: Icon(
    //     //     Icons.add,
    //     //     size: 20.sp,
    //     //     color: AppColors.purplep1,
    //     //   ),
    //     //),
    //   ),
    // );
  }
}
