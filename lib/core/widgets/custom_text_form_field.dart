import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:cine_reserve_app/core/constant/app_assets_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.onChanged,
    this.onTap,
    this.onTapIcon,
    this.readOnly = false,
  });
  final String? hintText;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function()? onTapIcon;

  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onChanged: onChanged,
      onTap: onTap,
      style: const TextStyle(color: AppColor.lavenderMist),
      cursorColor: AppColor.lavenderMist.withAlpha(153),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5.h),
          fillColor: AppColor.white.withAlpha(76),
          filled: true,
          prefixIconConstraints: const BoxConstraints(),
          hintText: hintText,
          hintStyle: AppFonts.regular_12
              .copyWith(color: AppColor.lavenderMist.withAlpha(153)),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: InkWell(
              onTap: onTapIcon,
              child: Image.asset(
                AppAssetsIcons.search,
                color: AppColor.lavenderMist,
                height: 16.h,
                width: 16.w,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10.w),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10.w),
            ),
          )),
    );
  }
}
