import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import 'custom_build_card.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.text,
    required this.value,
    required this.items,
    required this.onchange,
  });

  final T? value;
  final List<DropdownMenuItem<T>> items;
  final String text;
  final void Function(T?) onchange;

  @override
  Widget build(BuildContext context) {
    return CustomBuildCard(
      child: DropdownButton<T>(
        dropdownColor: AppColors.colorWhiteBlue,
        borderRadius: BorderRadius.circular(18.r),
        underline: const SizedBox.shrink(),
        isExpanded: true,
        hint: Text(text),
        value: value,
        items: items,
        onChanged: onchange,
      ),
    );
  }
}
