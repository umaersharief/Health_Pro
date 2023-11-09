import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/Cardregistration/user_plan_registration.dart';
import 'package:health_pro/view/payment_screen.dart';
import 'package:health_pro/view/widgets/widgets/custom_appbars.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';
import 'package:health_pro/view/widgets/widgets/custom_textfield.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets/custom_button.dart';
import 'Provider/cardregister_provider.dart';

class CardRegistration extends StatefulWidget {
  const CardRegistration(String s, {super.key});

  @override
  State<CardRegistration> createState() => _CardRegistrationState();
}

class _CardRegistrationState extends State<CardRegistration> {
  final GlobalKey<FormState> _formcardregisterKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  Future<void> setcontrollertext(BuildContext context) async {
    DateTime? pickeddate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (pickeddate != null) {
      String formatteddate = DateFormat('MM-dd-yyyy').format(pickeddate);
      dobController.text = formatteddate;
      setState(() {});
    }
  }

  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleappbar(text: 'Care Card Registration'),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(child: Consumer<CareCardRegiterProvider>(
          builder: (context, cardregister, child) {
            return Form(
              key: _formcardregisterKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 29.h,
                  ),
                  gettext('Full name'),
                  SizedBox(
                    height: 8.h,
                  ),
                  customTextField(
                    hintText: 'Enter full name',
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name ';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  gettext('Passport or QID Number'),
                  SizedBox(
                    height: 8.h,
                  ),
                  customTextField(
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    controller: idNumberController,
                    hintText: 'Enter your Passport or QID Number',
                    isKeyboard: false,
                    onChanged: (val) {
                      if (idNumberController.text.length == 12) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Passport or QID Number';
                      }
                      // if (value.length!=8) {
                      //   return 'Please enter your 8 digit Number';
                      // }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  gettext('Date of Birth'),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      customTextField(
                        hintText: 'MM/DD/YYYY',
                        width: 271.w,
                        controller: dobController,
                        readonly: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Select date of birth ';
                          }
                          return null;
                        },
                      ),
                      IconButton(
                          onPressed: () {
                            setcontrollertext(context);
                          },
                          icon: Icon(
                            Icons.calendar_month_outlined,
                            size: 45.sp,
                            color: const Color(0xff888880),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  gettext('Phone Number'),
                  SizedBox(
                    height: 8.h,
                  ),
                  IntlPhoneField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'QA',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  // customTextField(
                  //   controller: phoneController,
                  //   prefixImage: Image.asset(AppImages.flagicon),
                  //   hintText: '+973',
                  //   isKeyboard: true,
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please enter phone number ';
                  //     } else if (value.length >= 11) {
                  //       return 'Phone number should be at least 11 digit ';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  SizedBox(
                    height: 16.h,
                  ),
                  gettext('Gender'),
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: selected,
                        onChanged: (value) {
                          selected = value!;
                          setState(() {
                            cardregister.gender = 'Male';
                          });
                        },
                        activeColor: AppColors.blackb1,
                      ),
                      gettext('Male'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: selected,
                        onChanged: (value) {
                          selected = value!;
                          setState(() {
                            cardregister.gender = 'Female';
                          });
                        },
                        activeColor: AppColors.blackb1,
                      ),
                      gettext('Female'),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  customButton(
                      loading: cardregister.loading,
                      borderRadius: 24.r,
                      height: 48.h,
                      spinkitcolor: AppColors.white,
                      text: 'Countinue',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontColor: AppColors.dividercolor,
                      ontap: () async {
                        if (_formcardregisterKey.currentState!.validate()) {
                          _formcardregisterKey.currentState!.save();

                          UserPlanRegistration? data =
                              await cardregister.careCardRegister(
                            name: nameController.text,
                            idNumber: idNumberController.text,
                            phone: phoneController.text,
                            dob: dobController.text,
                            // amount: amountController.text,
                          );

                          if (data != null) {
                            Get.to(PaymentScreen(data));
                          }

                          // nameController.clear();
                          // idNumberController.clear();
                          // phoneController.clear();
                          // dobController.clear();
                        }
                      }),
                ],
              ),
            );
          },
        )),
      ),
    );
  }
}

Widget gettext(String text) {
  return customTextRegular(
      title: text,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: Color(0xff171725));
}
