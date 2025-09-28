import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy/core/constants/app_asset.dart';
import 'package:quizzy/core/helper/validator.dart';
import 'package:quizzy/core/routing/routes.dart';
import 'package:quizzy/core/widgets/custom_text_field.dart';
import 'package:quizzy/features/auth/presentation/cubit/login_cubit.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocListener<LoginCubit, bool>(
        listener: (context, state) {
          if (state) {
            Navigator.pushReplacementNamed(context, Routes.quizSetupRouteName);
          }
        },
        child: Builder(
          builder: (context) {
            final cubit = context.read<LoginCubit>();
            return GestureDetector(
              onTap: FocusScope.of(context).unfocus,
              child: Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.w, vertical: 10.h),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.asset(AppAsset.onBoardingTwo),
                            SizedBox(height: 9.h),
                            CustomTextField(
                              hint: AppStrings.name,
                              controller: nameController,
                              prefixIconName: Icon(
                                Icons.edit_note_rounded,
                                size: 28.sp,
                              ),
                              validator: (value) =>
                                  ValidatorHelper.validateName(value),
                            ),
                            SizedBox(height: 52.h),
                            CustomButton(
                              text: AppStrings.login,
                              onPressed: () async{
                                if (formKey.currentState!.validate()) {
                                  await cubit.saveName(nameController.text);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}