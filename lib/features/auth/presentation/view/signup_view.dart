import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';
import 'package:suits_app/core/utils/router/app_routes.dart';
import 'package:suits_app/core/utils/ui/app_bar.dart';
import 'package:suits_app/core/utils/ui/app_button.dart';
import 'package:suits_app/features/auth/presentation/manger/signup_cubit/signup_cubit.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_email_text_field.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_name_text_field.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_password_text_field.dart';
import 'package:suits_app/features/auth/presentation/widgets/terms_and_conditions.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

bool change = false;

class _SignupViewState extends State<SignupView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: const CustomAppBar(isLeading: true, title: 'Sign Up'),
        body: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccess) {
              context.go(AppRouter.kLoginView);
            } else if (state is SignupFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: AppDimensions.pagePadding,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomNameTextField(controller: _nameController),
                      const SizedBox(height: AppDimensions.medium),
                      CustomEmailTextField(controller: _emailController),
                      const SizedBox(height: AppDimensions.medium),
                      CustomPasswordTextField(
                        controller: _passwordController,
                        hintText: 'Enter your Password',
                      ),
                      const SizedBox(height: AppDimensions.small),
                      TermsAndConditions(
                        changed: (value) {
                          change = value;
                        },
                      ),
                      const SizedBox(height: 34),

                      AppButton(
                        isLoading: state is SignupLoading,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            if (change == false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please accept the terms and conditions.',
                                  ),
                                ),
                              );
                              return;
                            }
                            context.read<SignupCubit>().signup(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          }
                        },
                        text: 'Register',
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
