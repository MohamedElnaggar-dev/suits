import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:suits_app/features/auth/presentation/manger/otp_cubit/otp_cubit.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_email_text_field.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: const CustomAppBar(isLeading: true),
        body: BlocConsumer<OtpCubit, OtpState>(
          listener: (context, state) {
            if (state is OtpSentSuccess) {
              context.push(AppRouter.kVerificationCodeView);
            } else if (state is OtpFailure) {
              showSnakBar(context, state.errorMessage, isError: true);
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
                        'Forgot Your Password?',
                        style: AppStyles.bold(fontSize: 24),
                      ),
                      const SizedBox(height: AppDimensions.medium),
                      Text(
                        'Enter your email address and we’ll send you confirmation code',
                        style: AppStyles.reguler(
                          fontSize: 16,
                          color: AppColors.hintTextColor,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.medium),
                      CustomEmailTextField(controller: emailController),
                      const SizedBox(height: 34),
                      AppButton(
                        isLoading: state is OtpLoading,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            final email = emailController.text.trim();
                            final user = auth.currentUser;
                            if (user == null) {
                              showSnakBar(
                                context,
                                'No user is currently signed in.',
                                isError: true,
                              );
                              return;
                            }
                            if (email.isEmpty) {
                              showSnakBar(
                                context,
                                'Please enter your email address.',
                                isError: true,
                              );
                              return;
                            }
                            if (email != user.email) {
                              showSnakBar(
                                context,
                                'The entered email does not match the signed-in user.',
                                isError: true,
                              );
                              return;
                            }

                            context.read<OtpCubit>().sendOtpToEmail(
                              email: email,
                              uid: user.uid,
                            );
                          }
                        },
                        text: 'Reset Password',
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
