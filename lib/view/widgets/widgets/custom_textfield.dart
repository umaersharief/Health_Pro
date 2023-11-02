import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_pro/utils/app_colors.dart';

Widget customTextField({
  List<TextInputFormatter>? inputFormatters,
  bool showtext = true,
  String? hintText,
  FontWeight fontWeight = FontWeight.w400,
  TextEditingController? controller,
  // Function? validator,
  double fontSize = 12,
  Color bordercolor = AppColors.greytextfield,
  int maxLines = 1,
  bool? isprefixImage = false,
  // String? prefixImage ,
  bool? suffix = false,

  bool enableborder = false,
  Widget? suffixWidget,
  bool? isObscure = false,
  Color fillcolor = Colors.white,
  bool filled = false,
  double borderRadius = 8,
  double? width,
  double height = 46,
  bool nonborder = false,
  Function? ontap,
  // bool Ontap = false,
  bool isKeyboard = false,
  bool readonly = false,
  Function? onChanged,
  bool showErrorBorder = false,
  double errorBorderWidth = 2.0,
  bool isPrefixIcon = true,
  bool focusBorder = false,
  Widget? prefixImage,
  String? Function(String?)? validator,
  Color textFieldColor = Colors.blue,
  IconData prefixicon = Icons.mail,
  bool noOutlineBorder = true,
}) {
  return SizedBox(
    height: height.h,
    width: width,
    child: TextFormField(
      onTap: () {},
      // onChanged: (text){
      //   onChanged!();
      // },
      inputFormatters: inputFormatters,
      readOnly: readonly,
      controller: controller,
      validator: validator,
      keyboardType: isKeyboard ? TextInputType.number : TextInputType.text,
      maxLines: maxLines,

      obscureText: isObscure!,
      cursorColor: focusBorder ? Colors.yellow : null,
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: textFieldColor),
      // style: focusBorder?  const TextStyle(color: Colors.yellow,fontSize: 9):null,
      decoration: noOutlineBorder
          ? InputDecoration(
              // errorBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.red, width: 2),
              //   borderRadius: BorderRadius.circular(borderRadius),
              // ),
              filled: filled,
              fillColor: fillcolor,
              // focusedErrorBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.red, width: 2),
              //   borderRadius: BorderRadius.circular(borderRadius),
              // ),
              enabledBorder: enableborder
                  ? OutlineInputBorder(
                      borderSide: BorderSide(color: bordercolor, width: 2),
                      borderRadius: BorderRadius.circular(borderRadius),
                    )
                  : OutlineInputBorder(
                      borderSide: BorderSide(color: bordercolor),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              hintText: showtext ? hintText : null,
              prefixIcon: prefixImage,
              focusedBorder: enableborder
                  ? OutlineInputBorder(
                      borderSide: BorderSide(color: bordercolor, width: 2),
                      borderRadius: BorderRadius.circular(borderRadius),
                    )
                  : OutlineInputBorder(
                      borderSide: BorderSide(color: bordercolor, width: 2),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
              suffixIcon: suffix! ? suffixWidget : null,
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize,
                  color: Colors.grey,
                  height: 1,
                  fontFamily: 'Poppins'),
            )
          : InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize,
                  color: Colors.white,
                  height: 1,
                  fontFamily: 'Poppins'),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.brown, // Color for the enabled underline border
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.brown, // Color for the focused underline border
                ),
              ),
              suffixIcon: suffixWidget,
            ),
    ),
  );
}
