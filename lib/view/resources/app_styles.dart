import 'package:kabaten/view/resources/app_resources.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle h1Bold(BuildContext context) =>
      Theme.of(context).textTheme.headline1!.copyWith(
            fontSize: AppDimensions.h1TextSize,
            fontWeight: FontWeight.w700,
            color: AppColors.plainOn,
          );

  static TextStyle h1SemiBold(BuildContext context) =>
      Theme.of(context).textTheme.headline1!.copyWith(
            fontSize: AppDimensions.h1TextSize,
            fontWeight: FontWeight.w600,
            color: AppColors.plainOn,
          );

  static TextStyle h1Medium(BuildContext context) =>
      Theme.of(context).textTheme.headline1!.copyWith(
            fontSize: AppDimensions.h1TextSize,
            fontWeight: FontWeight.w500,
            color: AppColors.plainOn,
          );

  static TextStyle h1(BuildContext context) =>
      Theme.of(context).textTheme.headline1!.copyWith(
            fontSize: AppDimensions.h1TextSize,
            color: AppColors.plainOn,
          );

  static TextStyle h2Bold(BuildContext context) =>
      Theme.of(context).textTheme.headline2!.copyWith(
            fontSize: AppDimensions.h2TextSize,
            fontWeight: FontWeight.w700,
            color: AppColors.plainOn,
          );

  static TextStyle h2SemiBold(BuildContext context) =>
      Theme.of(context).textTheme.headline2!.copyWith(
            fontSize: AppDimensions.h2TextSize,
            fontWeight: FontWeight.w600,
            color: AppColors.plainOn,
          );

  static TextStyle h2Medium(BuildContext context) =>
      Theme.of(context).textTheme.headline2!.copyWith(
            fontSize: AppDimensions.h2TextSize,
            fontWeight: FontWeight.w500,
            color: AppColors.plainOn,
          );

  static TextStyle h2(BuildContext context) =>
      Theme.of(context).textTheme.headline2!.copyWith(
            fontSize: AppDimensions.h2TextSize,
            color: AppColors.plainOn,
          );

  static TextStyle h3Bold(BuildContext context) =>
      Theme.of(context).textTheme.headline3!.copyWith(
            fontSize: AppDimensions.h3TextSize,
            fontWeight: FontWeight.w700,
            color: AppColors.plainOn,
          );

  static TextStyle h3SemiBold(BuildContext context) =>
      Theme.of(context).textTheme.headline3!.copyWith(
            fontSize: AppDimensions.h3TextSize,
            fontWeight: FontWeight.w600,
            color: AppColors.plainOn,
          );

  static TextStyle h3Medium(BuildContext context) =>
      Theme.of(context).textTheme.headline3!.copyWith(
            fontSize: AppDimensions.h3TextSize,
            fontWeight: FontWeight.w500,
            color: AppColors.plainOn,
          );

  static TextStyle h3(BuildContext context) =>
      Theme.of(context).textTheme.headline3!.copyWith(
            fontSize: AppDimensions.h3TextSize,
            color: AppColors.plainOn,
          );

  static TextStyle p1Bold(BuildContext context) =>
      Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: AppDimensions.p1TextSize,
            fontWeight: FontWeight.w700,
            color: AppColors.plainOn,
          );

  static TextStyle p1SemiBold(BuildContext context) =>
      Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: AppDimensions.p1TextSize,
            fontWeight: FontWeight.w600,
            color: AppColors.plainOn,
          );

  static TextStyle p1Medium(BuildContext context) =>
      Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: AppDimensions.p1TextSize,
            fontWeight: FontWeight.w500,
            color: AppColors.plainOn,
          );

  static TextStyle p1(BuildContext context) =>
      Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: AppDimensions.p1TextSize,
            fontWeight: FontWeight.normal,
            color: AppColors.plainOn,
          );

  static TextStyle p2Bold(BuildContext context) =>
      Theme.of(context).textTheme.bodyText2!.copyWith(
            fontSize: AppDimensions.p2TextSize,
            fontWeight: FontWeight.w700,
            color: AppColors.plainOn,
          );

  static TextStyle p2SemiBold(BuildContext context) =>
      Theme.of(context).textTheme.bodyText2!.copyWith(
            fontSize: AppDimensions.p2TextSize,
            fontWeight: FontWeight.w600,
            color: AppColors.plainOn,
          );

  static TextStyle p2Medium(BuildContext context) =>
      Theme.of(context).textTheme.bodyText2!.copyWith(
            fontSize: AppDimensions.p2TextSize,
            fontWeight: FontWeight.w500,
            color: AppColors.plainOn,
          );

  static TextStyle p2(BuildContext context) =>
      Theme.of(context).textTheme.bodyText2!.copyWith(
            fontSize: AppDimensions.p2TextSize,
            color: AppColors.plainOn,
          );

  static TextStyle p2Light(BuildContext context) =>
      Theme.of(context).textTheme.bodyText2!.copyWith(
            fontSize: AppDimensions.p2TextSize,
            fontWeight: FontWeight.w300,
            color: AppColors.plainOn,
          );

  static TextStyle smallBold(BuildContext context) =>
      Theme.of(context).textTheme.caption!.copyWith(
            fontSize: AppDimensions.smallTextSize,
            fontWeight: FontWeight.w700,
            color: AppColors.plainOn,
          );

  static TextStyle smallSemiBold(BuildContext context) =>
      Theme.of(context).textTheme.caption!.copyWith(
            fontSize: AppDimensions.smallTextSize,
            fontWeight: FontWeight.w600,
            color: AppColors.plainOn,
          );

  static TextStyle smallMedium(BuildContext context) =>
      Theme.of(context).textTheme.caption!.copyWith(
            fontSize: AppDimensions.smallTextSize,
            fontWeight: FontWeight.w500,
            color: AppColors.plainOn,
          );

  static TextStyle small(BuildContext context) =>
      Theme.of(context).textTheme.caption!.copyWith(
            fontSize: AppDimensions.smallTextSize,
            color: AppColors.plainOn,
          );

  static TextStyle titleBold(BuildContext context) =>
      Theme.of(context).textTheme.caption!.copyWith(
            fontSize: AppDimensions.titleTextSize,
            fontWeight: FontWeight.w700,
            color: AppColors.plainOn,
            letterSpacing: AppDimensions.titleLetterSpacing,
          );

  static TextStyle titleSemiBold(BuildContext context) =>
      Theme.of(context).textTheme.caption!.copyWith(
            fontSize: AppDimensions.titleTextSize,
            fontWeight: FontWeight.w600,
            color: AppColors.plainOn,
            letterSpacing: AppDimensions.titleLetterSpacing,
          );

  static TextStyle titleMedium(BuildContext context) =>
      Theme.of(context).textTheme.caption!.copyWith(
            fontSize: AppDimensions.titleTextSize,
            fontWeight: FontWeight.w500,
            color: AppColors.plainOn,
            letterSpacing: AppDimensions.titleLetterSpacing,
          );

  static TextStyle title(BuildContext context) =>
      Theme.of(context).textTheme.caption!.copyWith(
            fontSize: AppDimensions.titleTextSize,
            color: AppColors.plainOn,
            letterSpacing: AppDimensions.titleLetterSpacing,
          );

  static TextStyle button(BuildContext context) =>
      Theme.of(context).textTheme.button!;

  static TextStyle normal(BuildContext context) => const TextStyle(
        color: AppColors.plainOn,
      );

  static TextStyle xSmallBold(BuildContext context) =>
      Theme.of(context).textTheme.caption!.copyWith(
            fontSize: AppDimensions.xSmallTextSize,
            fontWeight: FontWeight.w700,
            color: AppColors.plainOn,
          );
}
