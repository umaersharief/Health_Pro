import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_pro/view/widgets/widgets/custom_appbars.dart';

import '../../utils/app_colors.dart';
import '../widgets/widgets/custom_button.dart';
import '../widgets/widgets/custom_text.dart';

class Helpscreen extends StatefulWidget {
  const Helpscreen({super.key});

  @override
  State<Helpscreen> createState() => _HelpscreenState();
}

class _HelpscreenState extends State<Helpscreen> {
  List<QAData> qaList = [
    QAData(
      icon: CupertinoIcons.person_circle_fill,
      question: 'What is the HealthPro Care Card?',
      answer: '''
      Presenting the Health Pro Care Card, an exclusive discount program designed to cater to the needs of our esteemed subscribers. With this card in hand, you gain the incredible advantage of accessing discounted services at a diverse range of healthcare and medical facilities throughout the entire year. This means you can enjoy substantial savings on various healthcare treatments, consultations, and procedures. Experience the convenience of affordable healthcare without compromising on quality, courtesy of the Health Pro Care Card.
            ''',
    ),
    QAData(
      icon: CupertinoIcons.money_dollar_circle_fill,
      question: 'How does the HealthPro Care Card work?',
      answer: '''
The HealthPro Care Card is an exclusive discount program tailored for subscribers, offering a range of benefits to enhance access to healthcare services. With this card, subscribers can enjoy discounted rates on a wide array of healthcare treatments, consultations, and procedures. The program is designed to provide substantial savings throughout the entire year, ensuring that individuals can access quality healthcare without the burden of high costs.The card acts as a gateway to a network of healthcare and medical facilities that have partnered with the HealthPro Care Card program. Subscribers can present their card at these affiliated facilities to avail themselves of the discounted services. This system enables individuals to experience the convenience of affordable healthcare without compromising on quality. In essence, the HealthPro Care Card serves as a valuable tool for subscribers to manage their healthcare expenses effectively and make healthcare services more accessible.
            ''',
    ),
    QAData(
        icon: CupertinoIcons.clock_fill,
        question: 'What are the benefits of the HealthPro Care Card?',
        answer: '''
The HealthPro Care Card offers a multitude of benefits to cardholders, making it a highly advantageous proposition for individuals seeking affordable and accessible healthcare. Here are the key benefits of the HealthPro Care Card:

●   Exclusive Discounts: The card provides cardholders with exclusive discounts across a vast network of partnered medical and health facilities. This ensures that individuals can access a wide range of healthcare services at reduced rates, promoting affordability for essential treatments and indulgent luxury services alike.

●   Comprehensive Network: The card's extensive network spans a broad spectrum of healthcare establishments, covering crucial and necessary medical treatments as well as more indulgent and luxury services. This comprehensive coverage ensures that cardholders have access to a diverse range of healthcare options to meet their specific needs.

●   Affordable Rates for Various Departments: Cardholders can enjoy discounted rates for an array of medical departments. This means that regardless of the nature of their healthcare needs, individuals can benefit from cost savings on treatments and services, enhancing overall affordability.

●   Gateway to Enhanced Accessibility: The HealthPro Care Card serves as a gateway to enhanced accessibility within the realm of healthcare. By providing discounted access to a network of healthcare facilities, the card empowers individuals to prioritize their well-being without the financial barriers that can often accompany medical expenses.

●   Prioritizing Well-being without Compromise: The card enables individuals to prioritize their well-being without compromising on quality or cost. This ensures that cardholders can access quality healthcare services while enjoying the financial advantages of exclusive discounts, creating a balance between affordability and excellence in healthcare.

In summary, the HealthPro Care Card offers a comprehensive package of benefits, ranging from exclusive discounts and a diverse network to enhanced accessibility and prioritization of well-being. It is designed to make healthcare more affordable and convenient for individuals, encouraging them to take proactive steps towards maintaining their health.
'''),
    QAData(
      icon: CupertinoIcons.person_circle_fill,
      question: 'Who is eligible to subscribe to the Healthpro care card?',
      answer: '''
The HealthPro Care Card subscription is available to two distinct groups, offering tailored benefits to meet the diverse needs of individuals and corporate entities:

●   Individual Care Card:
   ○  Eligibility: The Individual Care Card is designed for individuals seeking personalized healthcare solutions.
   ○  Benefits: Cardholders gain exclusive discounts across an extensive network of partnered medical and health facilities, covering a wide range of healthcare services. This includes essential treatments and luxury services, promoting affordability and accessibility in healthcare. The card acts as a gateway to enhanced well-being without compromising on quality or cost.

●   Corporate Care Card:
   ○  Eligibility: The Corporate Care Card is specifically tailored for corporate entities and their employees.
   ○  Benefits: In addition to receiving discounts on medical and healthcare services, cardholders of the Corporate Care Card also gain access to valuable Workman's Compensation benefits. Workman's Compensation is a form of insurance providing financial and medical benefits to employees who suffer workrelated injuries or illnesses. This additional coverage ensures comprehensive support for employees in the event of work-related incidents, enhancing the overall well-being and security of the workforce.
   
●   In summary, the HealthPro Care Card is available for both individual subscribers and corporate entities. The Individual Care Card is suitable for those seeking personalized healthcare benefits, while the Corporate Care Card extends its advantages to employees by not only offering medical service discounts but also providing crucial coverage through Workman's Compensation in the workplace.
            ''',
    ),
    QAData(
        icon: CupertinoIcons.clock_fill,
        question: 'How do I subscribe to the HealthPro Care Card?',
        answer: '''
To subscribe to the HealthPro Care Card, follow these simple steps:

●   Download the HPCC App:
   ○  Download the "HPCC" mobile application on either iOS or Android from the respective app stores.

●   Select the Plan:
   ○  Upon launching the app, choose the plan that best suits your needs. You can explore the various plans available on the official website at www.healthpro.com.qa.

●   Payment for Opted Plan:
   ○  Once you have selected your preferred plan, proceed to make the payment for the subscription. The app should provide a secure payment gateway for your convenience.

●   Explore Partnered Providers:
   ○  Navigate to the "Service Provider" tab within the app to view a list of partnered medical and health facilities. These providers offer exclusive discounts to HealthPro Care Card subscribers.

●   Find Nearby Medical/Health Facilities:
   ○  To locate medical or health facilities in close proximity, use the "Service Provider Near Me" option. This feature allows you to easily identify nearby facilities that are part of the HealthPro Care Card network.

●   View Deals and Discounts:
   ○  Click on your preferred service provider to explore the exclusive deals and discounts available to HealthPro Care Card subscribers. This feature enables you to maximize the benefits of your subscription.

By following these steps, you can seamlessly subscribe to the HealthPro Care Card, gaining access to a network of partnered healthcare providers and enjoying the cost-saving advantages of the program. The user-friendly app interface enhances convenience in managing your healthcare subscription and exploring the diverse range of services available.
'''),
    QAData(
      icon: CupertinoIcons.clock_fill,
      question:
          'Is the HealthPro Care Card accepted at all healthcare facilities?',
      answer: '''
No, the HealthPro Care Card is not accepted at all healthcare facilities. It is exclusively honored at healthcare facilities with which HealthPro has agreements to provide services at special rates or discounts. The card functions within a network of partnered medical and health facilities, offering subscribers the advantage of accessing discounted services only at these specific establishments. Therefore, individuals using the HealthPro Care Card should ensure that they visit healthcare providers within the program's network to avail themselves of the agreed-upon special rates and discounts.
            ''',
    ),
    QAData(
      icon: CupertinoIcons.clock_fill,
      question: 'Can I use the Healthpro care card for my family members?',
      answer: '''
Yes, you can use the HealthPro Care Card for your family members, but this is possible only if you have subscribed with a family membership. If you have an individual or corporate membership, the use of the card is not extended to family members. Therefore, the eligibility for family members to benefit from the HealthPro Care Card is contingent upon having a specific family membership plan. This ensures that the advantages of the card can be shared within the subscribed family group.
            ''',
    ),
    QAData(
      icon: CupertinoIcons.clock_fill,
      question: 'Do I need to renew my Healthpro care card every year?',
      answer: '''
Yes, you need to renew your HealthPro Care Card every year. The renewal is an annual process, and it is essential to maintain uninterrupted access to the exclusive discounts and benefits offered by the HealthPro Care Card program. Therefore, subscribers are required to renew their membership on a yearly basis to continue enjoying the advantages of affordable and accessible healthcare services provided by the card.
            ''',
    ),
    QAData(
      icon: CupertinoIcons.clock_fill,
      question: 'Is my personal and medical information kept confidential?',
      answer: '''
Yes, your personal and medical information is kept confidential with HealthPro Care Card. The assurance is emphasized by the fact that HealthPro does not collect any data from the service providers they sign contracts with. Additionally, HealthPro takes measures to protect personal information such as contact numbers or usernames. This commitment to data privacy underscores the importance placed on maintaining the confidentiality and security of the subscribers' information within the HealthPro Care Card program.
            ''',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                shrinkWrap: true,
                children: qaList.map((qa) {
                  return ExpansionTile(
                    trailing: Icon(
                      qa.isExpanded
                          ? Icons.arrow_drop_up_outlined
                          : Icons.arrow_drop_down_outlined,
                      color: qa.isExpanded ? AppColors.cardcolor : Colors.black,
                    ),
                    title: customTextRegular(
                        textAlign: TextAlign.justify,
                        title: qa.question,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: qa.isExpanded
                            ? AppColors.cardcolor
                            : AppColors.blackb1),
                    leading: Icon(
                      qa.icon,
                      size: width * 0.08,
                      color: qa.isExpanded ? AppColors.cardcolor : null,
                    ),
                    onExpansionChanged: (expanded) {
                      setState(() {
                        qa.isExpanded = expanded;
                      });
                    },
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.03, bottom: height * 0.03),
                        child: Text(
                          textAlign: TextAlign.justify,
                          qa.answer,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.blackb1),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),

              // Expansioncomp(
              //   answer: answer,
              //   title: 'How does the HealthPro Care Card work?',
              //   icon: CupertinoIcons.money_dollar_circle_fill,
              // ),

              // Expansioncomp(
              //   answer: answer,
              //   title:
              //       'Is the HealthPro Care Card accepted at all healthcare facilities?',
              //   icon: CupertinoIcons.clock_fill,
              // ),

              // Expansioncomp(
              //   answer: answer,
              //   title:
              //       'Is my personal and medical information kept confidential?',
              //   icon: CupertinoIcons.clock_fill,
              // ),
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

class QAData {
  final String question;
  final String answer;
  bool isExpanded;
  IconData icon;

  QAData({
    required this.question,
    required this.answer,
    required this.icon,
    this.isExpanded = false,
  });
}
