import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:suits_app/core/utils/constants/app_assets.dart';
import 'package:suits_app/core/utils/constants/app_colors.dart';
import 'package:suits_app/core/utils/constants/app_dimensions.dart';
import 'package:suits_app/core/utils/constants/app_styles.dart';
import 'package:suits_app/core/utils/injector/get_it.dart';
import 'package:suits_app/core/utils/router/app_routes.dart';
import 'package:suits_app/core/utils/ui/app_bar.dart';
import 'package:suits_app/core/utils/ui/app_button.dart';
import 'package:suits_app/core/utils/ui/show_snak_bar.dart';
import 'package:suits_app/features/auth/presentation/manger/sign_in_with_google_cubit/sign_in_with_google_cubit.dart';
import 'package:suits_app/features/auth/presentation/manger/signin_cubit/signin_cubit.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_divider.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_email_text_field.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_login_with_accouts.dart';
import 'package:suits_app/features/auth/presentation/widgets/custom_password_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
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
        appBar: const CustomAppBar(isLeading: true, title: 'Login'),
        body: Form(
          key: _formKey,
          child: BlocConsumer<SigninCubit, SigninState>(
            listener: (context, state) {
              if (state is SigninSuccess) {
                context.go(AppRouter.kHomeView);
              } else if (state is SigninFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: AppDimensions.pagePadding,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Hi Welcome back, you’ve been missed',
                          style: AppStyles.semiBold(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: AppDimensions.medium),
                      CustomEmailTextField(controller: _emailController),
                      const SizedBox(height: AppDimensions.medium),
                      CustomPasswordTextField(
                        controller: _passwordController,
                        hintText: 'Enter your Password',
                      ),
                      const SizedBox(height: AppDimensions.small),
                      GestureDetector(
                        onTap: () {
                          context.push(AppRouter.kForgetPasswordView);
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot Password?',
                            style: AppStyles.semiBold(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 34),

                      SizedBox(
                        width: double.infinity,
                        child: AppButton(
                          isLoading: state is SigninLoading,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<SigninCubit>().signin(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                            }
                          },
                          text: 'Login',
                        ),
                      ),
                      const SizedBox(height: AppDimensions.medium),
                      RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: AppStyles.reguler(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: "Sign Up",
                              style: AppStyles.reguler(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  GoRouter.of(
                                    context,
                                  ).push(AppRouter.kSignupView);
                                },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppDimensions.medium),
                      const CustomDivider(),
                      const SizedBox(height: 30),

                      BlocProvider(
                        create: (context) => injector<SignInWithGoogleCubit>(),
                        child: const SigninWithGoogle(),
                      ),
                      const SizedBox(height: AppDimensions.medium),
                      const CustomLoginWithAccouts(
                        image: Assets.imagesAppleLogo,
                        text: 'Sign in with Apple',
                      ),
                      const SizedBox(height: AppDimensions.medium),

                      const CustomLoginWithAccouts(
                        image: Assets.imagesFacebook,
                        text: 'Sign in with Facebook',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SigninWithGoogle extends StatelessWidget {
  const SigninWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInWithGoogleCubit, SignInWithGoogleState>(
      listener: (context, state) {
        if (state is SignInWithGoogleSuccess) {
          context.go(AppRouter.kHomeView);
        } else if (state is SignInWithGoogleFailure) {
          showSnakBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomLoginWithAccouts(
          image: Assets.imagesGoogle,
          text: 'Sign in with google',
          onTap: () {
            context.read<SignInWithGoogleCubit>().signInWithGoogle();
          },
          isLoading: state is SignInWithGoogleLoading ? true : false,
        );
      },
    );
  }
}
