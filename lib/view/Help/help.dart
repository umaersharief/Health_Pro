import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_pro/view/Help/components/expansioncomp.dart';
import 'package:health_pro/view/widgets/widgets/custom_appbars.dart';

import '../../utils/app_colors.dart';
import '../widgets/widgets/custom_button.dart';
import '../widgets/widgets/custom_text.dart';

class Helpscreen extends StatelessWidget {
  const Helpscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var answer =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fringilla, justo sed vehicula tristique, purus purus lacinia nunc, eu ullamcorper justo leo non turpis. Sed euismod, justo a consequat bibendum, metus urna vulputate justo, a vulputate tellus nunc vel turpis. Sed eu elit eu elit condimentum malesuada. Vivamus euismod, velit ac scelerisque pharetra, est libero sodales ipsum, id lacinia elit dolor at orci. Aenean id sagittis eros. Sed non augue tincidunt, hendrerit nunc vel, laoreet felis. Suspendisse auctor, dui eget malesuada condimentum, ex purus tincidunt urna, nec fringilla odio elit in libero. Vivamus sed velit vitae purus commodo ultricies. Sed nec sapien a velit bibendum iaculis. Vivamus auctor dolor nec justo interdum, eu interdum justo interdum. Nullam at nisl ut quam tristique faucibus id in ex. Sed hendrerit quam nec sem dictum, ac ultrices libero bibendum.";
    return Scaffold(
      appBar: simpleappbar(text: 'Frequently Asked Questions'),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              Expansioncomp(
                answer: answer,
                title: 'What is the HealthPro Care Card?',
                icon: CupertinoIcons.person_circle_fill,
              ),
              Expansioncomp(
                answer: answer,
                title: 'How does the HealthPro Care Card work?',
                icon: CupertinoIcons.money_dollar_circle_fill,
              ),
              Expansioncomp(
                answer: answer,
                title: 'What are the benefits of the HealthPro Care Card?',
                icon: CupertinoIcons.clock_fill,
              ),
              Expansioncomp(
                answer: answer,
                title:
                    'Who is eligible to subscribe to the HealthPro Care Card?',
                icon: CupertinoIcons.clock_fill,
              ),
              Expansioncomp(
                answer: answer,
                title: 'How do I subscribe to the HealthPro Care Card?',
                icon: CupertinoIcons.clock_fill,
              ),
              Expansioncomp(
                answer: answer,
                title:
                    'Is the HealthPro Care Card accepted at all healthcare facilities?',
                icon: CupertinoIcons.clock_fill,
              ),
              Expansioncomp(
                answer: answer,
                title:
                    'Can I use the HealthPro Care Card for my family members?',
                icon: CupertinoIcons.clock_fill,
              ),
              Expansioncomp(
                answer: answer,
                title: 'Do I need to renew my HealthPro Care Card every year?',
                icon: CupertinoIcons.clock_fill,
              ),
              Expansioncomp(
                answer: answer,
                title:
                    'Is my personal and medical information kept confidential?',
                icon: CupertinoIcons.clock_fill,
              ),
              SizedBox(
                height: 30.h,
              ),
              customTextRegular(
                  title: 'Didn’t get the Solution ?',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff7B7B7B),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 30.h,
              ),
              customButton(
                borderRadius: 32.r,
                height: 48.h,
                color: AppColors.cardcolor,
                text: 'Contact to Customer Support',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontColor: AppColors.dividercolor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
