import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:cine_reserve_app/core/constant/app_fonts.dart';
import 'package:cine_reserve_app/core/utils/router.dart';
import 'package:cine_reserve_app/core/widgets/custom_icon_back.dart';
import 'package:cine_reserve_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.hintText,
    this.readOnly = false,
    this.isOnTapIcon = false,
    this.isOnTap = false,
    this.isLeading = false,
    this.onTapIcon,
    this.onChanged,
    this.isBottom = true,
    this.titleColor,
    this.backgroundIcon,
    this.backgroundTtile,
  });
  final String title;
  final String? hintText;
  final bool readOnly;
  final bool isOnTapIcon;
  final bool isOnTap;
  final bool isBottom;
  final bool isLeading;
  final void Function()? onTapIcon;
  final Color? titleColor;
  final void Function(String)? onChanged;
  final Color? backgroundIcon;
  final Color? backgroundTtile;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      //! attrbiuts app bar

      leadingWidth: 55.w,
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle:
          AppFonts.bold_20.copyWith(color: titleColor ?? AppColor.white),
      centerTitle: true,

      //! title appbar
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        decoration: BoxDecoration(
            color: backgroundTtile ?? Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        child: Text(
          title,
        ),
      ),

      //! leading appbar
      leading:
          isLeading ? CustomIconBack(backgroundIcon: backgroundIcon) : null,

      //! this bottom show text form field
      bottom: isBottom
          ? PreferredSize(
              preferredSize: preferredSize,
              child: SizedBox(
                height: 36.h,
                width: MediaQuery.of(context).size.width - 30.w,
                child: CustomTextFormField(
                  readOnly: readOnly,
                  hintText: hintText,
                  onChanged: onChanged,
                  onTapIcon: isOnTapIcon
                      ? () {
                          context.push(AppRouter.searchView);
                        }
                      : onTapIcon,
                  onTap: isOnTap
                      ? () {
                          context.push(AppRouter.searchView);
                        }
                      : null,
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 25.h);
}
