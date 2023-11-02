import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/UserProfile/components/listtilecomp.dart';
import 'package:health_pro/view/UserProfile/Provider/userprofile_provider.dart';
import 'package:health_pro/view/widgets/widgets/custom_appbars.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'usereditprofile.dart';
import '../widgets/widgets/custom_button.dart';

class GetUserProfile extends StatefulWidget {
  const GetUserProfile({super.key});

  @override
  State<GetUserProfile> createState() => _GetUserProfileState();
}

class _GetUserProfileState extends State<GetUserProfile> {
  @override
  void initState() {
    Provider.of<UserProfileProvider>(context, listen: false).getUserProfile();
    super.initState();
  }

  // bool editable = false;
  // File? _image;
  // Future<void> setimage() async {
  //   final pickedimage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedimage != null) {
  //     _image = File(pickedimage.path);
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleappbar(text: 'Profile'),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(child: Consumer<UserProfileProvider>(
          builder: (context, userprofile, child) {
            // ignore: prefer_is_empty
            return userprofile.userProfileModel.length == 0
                ? SpinKitCircle(color: AppColors.blueb9, size: 22.sp)
                : Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        children: [
                          Stack(
                            children: [
                              // CircleAvatar(
                              //   backgroundImage: _image == null
                              //       ? AssetImage(AppImages.person4)
                              //       : Image.file(
                              //           _image!,
                              //           fit: BoxFit.cover,
                              //         ).image,
                              //   radius: 50,
                              // ),
                              // CircleAvatar(
                              //   radius: 60.r,
                              //   backgroundImage: userprofile
                              //               .userProfileModel[0].data!.image !=
                              //           null
                              //       ? NetworkImage(
                              //           "${userprofile.userProfileModel[0].data!.image}",
                              //         )
                              //       : AssetImage("assets/images/avatar.png")
                              //           as ImageProvider<Object>,
                              // ),
                              CircleAvatar(
                                radius: 55.w,
                                backgroundImage: userprofile
                                            .userProfileModel[0].data!.image !=
                                        ""
                                    ? NetworkImage(
                                        userprofile
                                            .userProfileModel[0].data!.image
                                            .toString(),
                                      )
                                    : AssetImage("assets/images/avatar.png")
                                        as ImageProvider<Object>,
                              ),

                              // Positioned(
                              //   bottom: -5,
                              //   right: -2,
                              //   child: IconButton(
                              //     onPressed: () {
                              //       // setimage();
                              //       showOptionsDialog(context);
                              //     },
                              //     icon: Icon(
                              //       CupertinoIcons.camera_fill,
                              //       color: AppColors.cardcolor,
                              //       size: 30.sp,
                              //     ),
                              //   ),
                              // )
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
                                  title:
                                      '${userprofile.userProfileModel[0].data!.name == null ? "Name" : userprofile.userProfileModel[0].data!.name}',
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.blackb1),
                              SizedBox(
                                height: 10.h,
                              ),
                              customTextRegular(
                                  title:
                                      '${userprofile.userProfileModel[0].data!.username == null ? "" : userprofile.userProfileModel[0].data!.username}',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blackb1),
                              SizedBox(
                                height: 10.h,
                              ),
                              customTextRegular(
                                  title:
                                      '${userprofile.userProfileModel[0].data!.planName == null ? "" : userprofile.userProfileModel[0].data!.planName}',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffCA9C16)),
                            ],
                          ))
                        ],
                      ),
                      SizedBox(height: 40.h),
                      Listtilecomp(
                        title: "Name",
                        subtitle:
                            '${userprofile.userProfileModel[0].data!.name == null ? "Name" : userprofile.userProfileModel[0].data!.name}',
                        trailing: GestureDetector(
                          onTap: () {
                            Get.to(() => UserEditProfile(
                                  name:
                                      '${userprofile.userProfileModel[0].data!.name == null ? "Name" : userprofile.userProfileModel[0].data!.name}',
                                  image:
                                      '${userprofile.userProfileModel[0].data!.image}',
                                  phone:
                                      '${userprofile.userProfileModel[0].data!.phone == null ? "Phone" : userprofile.userProfileModel[0].data!.phone}',
                                  username:
                                      '${userprofile.userProfileModel[0].data!.username == null ? "" : userprofile.userProfileModel[0].data!.username}',
                                  planname:
                                      '${userprofile.userProfileModel[0].data!.planName == null ? "" : userprofile.userProfileModel[0].data!.planName}',
                              id: '${userprofile.userProfileModel[0].data!.idNumber == null ? "" : userprofile.userProfileModel[0].data!.idNumber}',

                            ));
                          },
                          child: Icon(
                            Icons.edit_square,
                            size: 25.sp,
                            color: AppColors.cardcolor,
                          ),
                        ),
                      ),
                      Listtilecomp(
                        title: "Phone",
                        subtitle:
                            '${userprofile.userProfileModel[0].data!.phone == null ? "Phone" : userprofile.userProfileModel[0].data!.phone}',
                        trailing: GestureDetector(
                          onTap: () {
                            Get.to(() => UserEditProfile(
                                  name:
                                      '${userprofile.userProfileModel[0].data!.name == null ? "Name" : userprofile.userProfileModel[0].data!.name}',
                                  image:
                                      '${userprofile.userProfileModel[0].data!.image}',
                                  phone:
                                      '${userprofile.userProfileModel[0].data!.phone == null ? "Phone" : userprofile.userProfileModel[0].data!.phone}',
                                  username:
                                      '${userprofile.userProfileModel[0].data!.username == null ? "Username" : userprofile.userProfileModel[0].data!.username}',
                                  planname:
                                      '${userprofile.userProfileModel[0].data!.planName == null ? "" : userprofile.userProfileModel[0].data!.planName}',
                              id: '${userprofile.userProfileModel[0].data!.idNumber == null ? "" : userprofile.userProfileModel[0].data!.idNumber}',

                            ));
                          },
                          child: Icon(
                            Icons.edit_square,
                            size: 25.sp,
                            color: AppColors.cardcolor,
                          ),
                        ),
                      ),
                      Listtilecomp(
                        title: "Email",
                        subtitle:
                            '${userprofile.userProfileModel[0].data!.email == null ? "Email" : userprofile.userProfileModel[0].data!.email}',
                        trailing: SizedBox(),
                        // trailing: GestureDetector(
                        //   onTap: () {
                        //     Get.to(() => UserEditProfile(
                        //           name:
                        //               '${userprofile.userProfileModel[0].data!.name == null ? "Name" : userprofile.userProfileModel[0].data!.name}',
                        //           image:
                        //               '${userprofile.userProfileModel[0].data!.image}',
                        //           phone:
                        //               '${userprofile.userProfileModel[0].data!.phone == null ? "Phone" : userprofile.userProfileModel[0].data!.phone}',
                        //           username:
                        //               '${userprofile.userProfileModel[0].data!.username == null ? "Username" : userprofile.userProfileModel[0].data!.username}',
                        //           planname:
                        //               '${userprofile.userProfileModel[0].data!.planName == null ? "" : userprofile.userProfileModel[0].data!.planName}',
                        //       id: '${userprofile.userProfileModel[0].data!.idNumber == null ? "" : userprofile.userProfileModel[0].data!.idNumber}',
                        //
                        //     ));
                        //   },
                        //   child: Icon(
                        //     Icons.edit_square,
                        //     size: 25.sp,
                        //     color: AppColors.greytextfield,
                        //   ),
                        // ),
                      ),
                      Listtilecomp(
                        title: "ID Number",
                        subtitle:
                            '${userprofile.userProfileModel[0].data!.idNumber == null ? "" : userprofile.userProfileModel[0].data!.idNumber}',
                        trailing: GestureDetector(
                          onTap: () {
                            Get.to(() => UserEditProfile(
                                  name:
                                      '${userprofile.userProfileModel[0].data!.name == null ? "Name" : userprofile.userProfileModel[0].data!.name}',
                                  image:
                                      '${userprofile.userProfileModel[0].data!.image}',
                                  phone:
                                      '${userprofile.userProfileModel[0].data!.phone == null ? "Phone" : userprofile.userProfileModel[0].data!.phone}',
                                  username:
                                      '${userprofile.userProfileModel[0].data!.username == null ? "Username" : userprofile.userProfileModel[0].data!.username}',
                                  planname:
                                      '${userprofile.userProfileModel[0].data!.planName == null ? "" : userprofile.userProfileModel[0].data!.planName}',
                              id: '${userprofile.userProfileModel[0].data!.idNumber == null ? "" : userprofile.userProfileModel[0].data!.idNumber}',

                            ));
                          },
                          child: Icon(
                            Icons.edit_square,
                            size: 25.sp,
                            color: AppColors.cardcolor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      customButton(
                        borderRadius: 24.r,
                        height: 46.h,
                        color: AppColors.cardcolor,
                        text: 'Edit',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontColor: AppColors.dividercolor,
                        ontap: () {
                          Get.to(() => UserEditProfile(
                                name:
                                    '${userprofile.userProfileModel[0].data!.name == null ? "Name" : userprofile.userProfileModel[0].data!.name}',
                                image:
                                    '${userprofile.userProfileModel[0].data!.image}',
                                phone:
                                    '${userprofile.userProfileModel[0].data!.phone == null ? "Phone" : userprofile.userProfileModel[0].data!.phone}',
                                username:
                                    '${userprofile.userProfileModel[0].data!.username == null ? "Username" : userprofile.userProfileModel[0].data!.username}',
                                planname:
                                    '${userprofile.userProfileModel[0].data!.planName == null ? "" : userprofile.userProfileModel[0].data!.planName}',
                            id: '${userprofile.userProfileModel[0].data!.idNumber == null ? "" : userprofile.userProfileModel[0].data!.idNumber}',
                              ));
                        },
                      )
                    ],
                  );
          },
        )),
      ),
    );
  }
}
