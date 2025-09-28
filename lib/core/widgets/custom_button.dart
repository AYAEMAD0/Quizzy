import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_styles.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.colorWhiteBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.sp)),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      child: Text(text,style: TextStyles.font22PrimarySemiBold,)
    );
  }
}
