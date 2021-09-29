import 'package:flutter/material.dart';
import '/shared/styles/app_colors.dart';

class AppFonts {
  static final regularFont = FontWeight.w400;
  static final semiBoldFont = FontWeight.w500;
  static final boldFont = FontWeight.w600;

  static TextStyle appBarTitle() => TextStyle(
        color: AppColors.appWhite,
        fontSize: 24,
        fontWeight: boldFont,
      );
  static TextStyle cartValue() => TextStyle(
        color: AppColors.appWhite,
        fontSize: 18,
        fontWeight: semiBoldFont,
      );
  static TextStyle cartCheckOutBtn() =>
      TextStyle(color: AppColors.appBlue2, fontSize: 18, fontWeight: boldFont);

  static TextStyle cartTileValue() => TextStyle(
        color: AppColors.appBlack,
        fontSize: 18,
        fontWeight: semiBoldFont,
      );

  static TextStyle cartTileTitle() =>
      TextStyle(color: AppColors.appBlack, fontSize: 18, fontWeight: boldFont);

  static TextStyle cartTileSubTitle() => TextStyle(
        color: AppColors.appGray4,
        fontSize: 14,
        fontWeight: regularFont,
      );

  static TextStyle categoryCardTitle() => TextStyle(
        color: AppColors.appBlack,
        fontSize: 24,
        fontWeight: boldFont,
      );
  static TextStyle categoryCardText() => TextStyle(
        color: AppColors.appGray4,
        fontSize: 14,
        fontWeight: semiBoldFont,
      );
  static TextStyle categoryCardBtn() => TextStyle(
        color: AppColors.appWhite,
        fontSize: 16,
        fontWeight: semiBoldFont,
      );

  static TextStyle productCardTitle() =>
      TextStyle(color: AppColors.appBlack, fontSize: 24, fontWeight: boldFont);
  static TextStyle productCardTDescription() => TextStyle(
        color: AppColors.appGray4,
        fontSize: 12,
        fontWeight: semiBoldFont,
      );
  static TextStyle productCardPrice() => TextStyle(
        color: AppColors.appBlue2,
        fontSize: 16,
        fontWeight: semiBoldFont,
      );
  static TextStyle productCardBtn() => TextStyle(
        color: AppColors.appWhite,
        fontSize: 16,
        fontWeight: semiBoldFont,
      );

  static TextStyle dialogTitle() => TextStyle(
        color: AppColors.appBlack,
        fontSize: 24,
        fontWeight: boldFont,
      );
  static TextStyle dialogQuantity() => TextStyle(
        color: AppColors.appWhite,
        fontSize: 16,
        fontWeight: semiBoldFont,
      );
  static TextStyle dialogCancelBtn() => TextStyle(
        color: AppColors.appWhite,
        fontSize: 16,
        fontWeight: semiBoldFont,
      );
  static TextStyle dialogConfirmBtn() => TextStyle(
        color: AppColors.appWhite,
        fontSize: 16,
        fontWeight: semiBoldFont,
      );

  static TextStyle cartQuantityNumber() => TextStyle(
        color: AppColors.appWhite,
        fontSize: 10,
        fontWeight: semiBoldFont,
      );
}
