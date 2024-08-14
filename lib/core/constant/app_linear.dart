import 'package:cine_reserve_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

abstract class AppLinear {
  static const LinearGradient linearPages = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColor.secondry,
        AppColor.primary,
      ]);

  static LinearGradient linearButton = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColor.tan,
        AppColor.coralRed,
      ]);
  static LinearGradient linearConrainer = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColor.secondry.withOpacity(0.1),
        AppColor.secondry,
        AppColor.secondry,
        AppColor.secondry,
      ]);
  static LinearGradient linearReservation = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColor.primary,
        AppColor.button,
      ]);
  static LinearGradient withOpacity = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColor.coralRed.withOpacity(0.8),
        AppColor.tan.withOpacity(0.7),
      ]);
}
