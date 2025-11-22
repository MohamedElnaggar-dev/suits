import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';
import 'package:suits_app/core/utils/router/app_routes.dart';
import 'package:suits_app/core/utils/ui/app_bar.dart';
import 'package:suits_app/core/utils/ui/app_button.dart';
import 'package:suits_app/core/utils/ui/show_snak_bar.dart';
import 'package:suits_app/features/auth/presentation/manger/forget_password_cubit/forget_password_cubit.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_password_text_field.dart';

class CreateNewPasswordView extends StatefulWidget {
  const CreateNewPasswordView({super.key});

  @override
  State<CreateNewPasswordView> createState() => _CreateNewPasswordViewState();
}

class _CreateNewPasswordViewState extends State<CreateNewPasswordView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: const CustomAppBar(isLeading: true),
        body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordSuccess) {
              context.push(AppRouter.kLoginView);
            } else if (state is ForgetPasswordFailure) {
              showSnakBar(context, state.errorMessage);
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: AppDimensions.pagePadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create New Password',
                        style: AppStyles.bold(fontSize: 24),
                      ),
                      const SizedBox(height: AppDimensions.medium),
                      Text(
                        'ECreate your new password to login',
                        style: AppStyles.reguler(
                          fontSize: 16,
                          color: AppColors.hintTextColor,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.medium),
                      CustomPasswordTextField(
                        hintText: 'Enter the New Password',
                        controller: _newPasswordController,
                      ),
                      const SizedBox(height: AppDimensions.medium),
                      CustomPasswordTextField(
                        hintText: 'Enter the New Password Again',
                        controller: _confirmPasswordController,
                      ),
                      const SizedBox(height: 34),
                      AppButton(
                        isLoading: state is ForgetPasswordLoading,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            if (_newPasswordController.text !=
                                _confirmPasswordController.text) {
                              showSnakBar(context, 'Passwords do not match.');
                              return;
                            } else if (_newPasswordController.text ==
                                _confirmPasswordController.text) {
                              context
                                  .read<ForgetPasswordCubit>()
                                  .forgetPassword(
                                    newPassword: _newPasswordController.text,
                                  );
                            }
                          }
                        },
                        text: 'Create Password',
                      ),
                      const SizedBox(height: AppDimensions.medium),
                    ],
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
