import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_pro/view/Healthhistory/components/healthcomp.dart';
import 'package:health_pro/view/widgets/widgets/custom_appbars.dart';

class Healthhistory extends StatelessWidget {
  const Healthhistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleappbar(text: 'My Transactions'),
      body: ListView(
        children: [
          SizedBox(
            height: 16.h,
          ),
          Healthcomp(status: 'Completed'),
          Healthcomp(status: 'Completed'),
          Healthcomp(status: 'Pending'),
        ],
      ),
    );
  }
}
