import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/widgets/widgets/custom_appbars.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';
import 'Provider/editprofile_provider.dart';
import '../widgets/widgets/custom_button.dart';

// ignore: must_be_immutable
class UserEditProfile extends StatefulWidget {
  String image, name, phone, username, planname,id;

  UserEditProfile({
    Key? key,
    required this.phone,
    required this.image,
    required this.name,
    required this.username,
    required this.planname,
    required this.id,
  }) : super(key: key);

  @override
  State<UserEditProfile> createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  late TextEditingController nameController;

  late TextEditingController phoneController;
  late TextEditingController idController;
  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.name);
    phoneController = TextEditingController(text: widget.phone);
    idController = TextEditingController(text: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleappbar(text: 'Edit Profile'),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(child: Consumer<EdittProfileProvider>(
          builder: (context, editprofile, child) {
            // ignore: prefer_is_empty
            return Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 55.w,
                          backgroundImage: NetworkImage(widget.image),
                          child: editprofile.imageFile != null
                              ? ClipOval(
                                  child: Image.file(
                                    editprofile.imageFile!,
                                    fit: BoxFit.cover,
                                    width: 130.w,
                                    height: 130.h,
                                  ),
                                )
                              : Center(
                                  child: Text(''),
                                ),
                        ),
                        Positioned(
                          bottom: -5,
                          right: -2,
                          child: IconButton(
                            onPressed: () {
                              // setimage();
                              showOptionsDialog(context);
                            },
                            icon: Icon(
                              CupertinoIcons.camera_fill,
                              color: AppColors.cardcolor,
                              size: 30.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customTextRegular(
                            title: widget.name,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blackb1),
                        SizedBox(
                          height: 10.h,
                        ),
                        customTextRegular(
                            title: widget.username,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackb1),
                        SizedBox(
                          height: 10.h,
                        ),
                        customTextRegular(
                            title: widget.planname,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffCA9C16)),
                      ],
                    ))
                  ],
                ),
                SizedBox(height: 40.h),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      label: Text("Name",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.cardcolor)),
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: BorderSide(
                              color: AppColors.greytextfield, width: 3.w))),
                ),
                SizedBox(height: 20.sp),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text("Phone",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.cardcolor)),
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: BorderSide(
                              color: AppColors.greytextfield, width: 3.w))),
                ),
                SizedBox(height: 20.sp),
                TextFormField(
                   inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
              ],
                  controller: idController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text("Passport or QID Number",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.cardcolor)),

                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: BorderSide(
                              color: AppColors.greytextfield, width: 3.w))),
                ),
                SizedBox(
                  height: 50.h,
                ),
                customButton(
                    loading: editprofile.loading,
                    borderRadius: 24.r,
                    height: 46.h,
                    spinkitcolor: AppColors.white,
                    text: 'Save',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: AppColors.dividercolor,
                    ontap: () {
                      editprofile.updateUserProfile(
                          name: nameController.text,
                          phone: phoneController.text,id: idController.text);
                    })
              ],
            );
          },
        )),
      ),
    );
  }
}

Future<void> showOptionsDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(child: Consumer<EdittProfileProvider>(
            builder: (context, value, child) {
              return ListBody(
                children: [
                  GestureDetector(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera,
                          size: 20.sp,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "From Camera",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    onTap: () {
                      value.getFromCamera();
                      Navigator.pop(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10.h)),
                  GestureDetector(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          size: 20.sp,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "From Gallery",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    onTap: () {
                      value.getFromGallery();
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          )),
        );
      });
}
