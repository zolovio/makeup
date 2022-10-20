import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/common_button.dart';
import 'package:makeup/src/core/ui/common_widget/common_switch.dart';
import 'package:makeup/src/core/ui/common_widget/social_button.dart';
import 'package:makeup/src/core/ui/theme.dart';
import 'package:makeup/src/feature/auth/ui/login/login_vm.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Consumer(builder: (context, ref, _) {
          final _vm = ref.watch(loginVmProvider);
          return FormBuilder(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign in',
                        style: AppDecoration.textStyle(
                          color: AppColors.yellow,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: FormBuilderTextField(
                      style: AppDecoration.textStyle(),
                      decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              'assets/email_icon.png',
                              height: 2.h,
                              width: 2.h,
                              color: AppColors.hintColor,
                            ),
                          ),
                          fillColor: AppColors.textFieldColor,
                          border: AppDecoration.inputBorder,
                          focusedBorder: AppDecoration.inputBorder,
                          enabledBorder: AppDecoration.inputBorder,
                          hintText: "abc@gmail.com",
                          hintStyle: AppDecoration.textStyle()),
                      name: 'email',
                      controller: emailController,
                      onChanged: (val) {
                        _formKey.currentState!.fields['email']!.validate();
                        setState(() {});
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: FormBuilderTextField(
                      style: AppDecoration.textStyle(),
                      decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              'assets/password_icon.png',
                              height: 2.h,
                              width: 2.h,
                              color: AppColors.hintColor,
                            ),
                          ),
                          fillColor: AppColors.textFieldColor,
                          border: AppDecoration.inputBorder,
                          focusedBorder: AppDecoration.inputBorder,
                          enabledBorder: AppDecoration.inputBorder,
                          hintText: "Your password",
                          hintStyle: AppDecoration.textStyle()),
                      name: 'password',
                      controller: passwordController,
                      obscureText: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Row(
                      children: [
                        CommonSwitch(
                          label: 'Remember me',
                          onSwitch: () {
                            _vm.onRememberSwitch();
                          },
                          isActive: _vm.isActive,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            _vm.onFogotPasswordTap(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Forgot Password?',
                              style: AppDecoration.textStyle(
                                  color: AppColors.yellow, fontSize: 20.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CommonButton(
                    buttonText: 'SIGN IN',
                    onButtonTap: () {
                      FocusScope.of(context).unfocus();
                      // if (_formKey.currentState!.saveAndValidate()) {
                      _vm.onSignInTap(emailController.text,
                          passwordController.text, context);
                      // }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'OR',
                      style: AppDecoration.textStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SocialButton(
                    buttonText: 'Login with Google',
                    onButtonTap: () {
                      FocusScope.of(context).unfocus();
                      _vm.googleLogin(context);
                    },
                    assets: 'assets/google_icon.png',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SocialButton(
                    buttonText: 'Login with Facebook',
                    onButtonTap: () {
                      FocusScope.of(context).unfocus();
                      _vm.facebookLogin(context);
                    },
                    assets: 'assets/facebook_icon.png',
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account ? ',
                        style: AppDecoration.textStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      InkWell(
                        onTap: () {
                          _vm.onSignupTap(context);
                        },
                        child: Text(
                          'Sign up',
                          style: AppDecoration.textStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkBlue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
