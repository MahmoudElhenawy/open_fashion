import 'package:amimooo/constens.dart';
import 'package:amimooo/core/utils/app_routers.dart';
import 'package:amimooo/core/utils/assets.dart';
import 'package:amimooo/core/utils/styles.dart';
import 'package:amimooo/features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:amimooo/features/auth/presentation/views/sign_up_view.dart';
import 'package:amimooo/features/auth/presentation/views/widgets/custom_bottom.dart';
import 'package:amimooo/features/auth/presentation/views/widgets/custom_snackBar.dart';
import 'package:amimooo/features/auth/presentation/views/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          CustomSnackBar.show(context, state.errorMessage);
        } else if (state is LoginSuccess) {
          GoRouter.of(context).push(AppRouters.homeView);
          CustomSnackBar.show(context, "Login successful");
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 100),
                  // Logo
                  Center(
                    child: SvgPicture.asset(
                      AssetsData.logo,
                      width: 100,
                      fit: BoxFit.contain,
                      color: kpcolor,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "Login",
                      style: Styles.textStyle40,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    isPassword: true,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  GestureDetector(
                    onTap: () => context.push(AppRouters.forgetPasswardView),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Passward?',
                        style: Styles.textStyle16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  CustomButton(
                    text: 'Login',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context).signInWithGmail(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupView(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign up now",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kpcolor),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
