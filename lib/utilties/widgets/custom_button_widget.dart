import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_ultimate/utilties/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.title,
      this.width,
      this.height,
      this.radius = 30,
      this.backgroundColor,
      this.fontSize,
      this.horizontalPadding,
      this.verticalPadding ,
      this.fontWeight,
      this.margin,
      required this.onTap,
      this.style,
      this.decoration,
      this.textColor,
      this.hasBackgroundColor = true,
      this.borderColor,
      this.iconWidget})
      : super(key: key);

  final void Function()? onTap;
  final String title;
  final double? width, height;
  final Color? backgroundColor;
  final double? radius;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextStyle? style;
  final double? horizontalPadding, verticalPadding;
  final BoxDecoration? decoration;
  final Widget? iconWidget;
  final bool hasBackgroundColor;
  final Color? textColor, borderColor;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
         height: height?.h,
         width: width?.w,
        padding: EdgeInsets.symmetric(vertical: verticalPadding??14.h, horizontal: horizontalPadding ??0),
        // margin: margin?? EdgeInsets.symmetric(horizontal: 8.w),
        decoration: decoration ??
            BoxDecoration(
              color: backgroundColor,
              // gradient: hasBackgroundColor ? ThemeClass.gradientBtn : null,
              borderRadius: radius == null
                  ? BorderRadius.circular(10.w)
                  : BorderRadius.circular(radius!.w),
              border: Border.all(color: borderColor ?? Colors.transparent)

            ),
        child: iconWidget != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: style ??
                          TextStyle(
                            color: Colors.white,
                            fontSize: fontSize ?? 16.sp,
                            fontWeight: fontWeight ?? FontWeight.w700,
                            overflow: TextOverflow.ellipsis,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ),
                  iconWidget!
                ],
              )
            : Text(
                title,
                style: style ??
                    TextStyle(
                        color: textColor ?? ThemeClass.whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600, ),textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
