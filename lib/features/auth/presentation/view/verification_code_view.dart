import 'dart:async';

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
import 'package:suits_app/features/auth/presentation/widgets/custom_pin_code_text_field.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_text.dart';

class VerificationCodeView extends StatefulWidget {
  const VerificationCodeView({super.key});

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
  String enteredOtp = "";
  int secondsLeft = 60;
  Timer? _timer;
  final auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void startTimer() {
    _timer?.cancel();
    setState(() {
      secondsLeft = 60;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft == 0) {
        timer.cancel();
      } else {
        setState(() {
          secondsLeft--;
        });
      }
    });
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
            if (state is OtpFailure) {
              showSnakBar(context, state.errorMessage);
            } else if (state is OtpVerifiedSuccess) {
              context.push(AppRouter.kCreateNewPasswordView);
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
                        'Enter Verification Code',
                        style: AppStyles.bold(fontSize: 24),
                      ),
                      const SizedBox(height: AppDimensions.medium),
                      Text(
                        'Enter the verification code sent to your email address',
                        style: AppStyles.reguler(
                          fontSize: 16,
                          color: AppColors.hintTextColor,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.medium),
                      CustomPinCodeTextField(
                        onChanged: (value) {
                          enteredOtp = value;
                        },
                      ),
                      const SizedBox(height: 34),
                      AppButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<OtpCubit>().verifyOtp(
                              enteredOtp: enteredOtp,
                              uid: auth.currentUser!.uid,
                            );
                          }
                        },
                        text: 'Verify',
                      ),
                      const SizedBox(height: AppDimensions.medium),
                      const Center(
                        child: CustomText(
                          blackText: 'Didn’t receive the code?',
                          primaryColorText: ' Resend',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: secondsLeft == 0
                                ? () {
                                    context.read<OtpCubit>().sendOtpToEmail(
                                      email: auth.currentUser!.email!,
                                      uid: auth.currentUser!.uid,
                                    );
                                    startTimer();
                                  }
                                : null,
                            child: Text(
                              "أعد ارسال الرمز ؟",
                              style: TextStyle(
                                color: secondsLeft == 0
                                    ? Colors.blue
                                    : Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Text(
                            "00:${secondsLeft.toString().padLeft(2, '0')}",
                            style: AppStyles.reguler(
                              fontSize: 16,
                              color: AppColors.hintTextColor,
                            ),
                          ),
                        ],
                      ),
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
