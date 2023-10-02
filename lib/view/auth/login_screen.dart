import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:operations/core/view_model/repo/cubit/auth_cubit.dart';
import 'package:operations/view/auth/signup_screen.dart';
import 'package:operations/view/home_view.dart';
import 'package:operations/view/widgets/custom_button.dart';
import 'package:operations/view/widgets/custom_sign_button.dart';
import 'package:operations/view/widgets/custom_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants.dart';
import '../widgets/custom_text_form.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  String? email, password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var controller = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
          } else if (state is AuthError) {}
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: CustomText(
                        text: "Login",
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormFiled(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter vaild Email';
                            }
                            return null;
                          },
                          labelText: "Email",
                          onSaved: (value) {
                            email = value;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormFiled(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter vaild Password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            password = value!;
                          },
                          labelText: "Password",
                          obscureText: obscureText,
                          icon: IconButton(
                              color: primaryColor,
                              onPressed: () {
                                setState(() {});
                                obscureText = !obscureText;
                              },
                              icon: const Icon(Icons.remove_red_eye_rounded)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: CustomButton(
                            onPressed: () {
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                controller.signInWithEmailAndPassword(
                                    email!, password!);
                              }
                            },
                            text: 'Login',
                            color: primaryColor,
                            textColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomText(
                                text: 'Don\'t have an account ?',
                                color: Color(0xFF848484),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(SignupScreen());
                                },
                                child: const CustomText(
                                  text: 'Sign Up',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: CustomSignButton(
                              onTap: () {
                                BlocProvider.of<AuthCubit>(context)
                                    .signInWithGoogle();
                              },
                              icon: FontAwesomeIcons.google,
                              text: 'Sign In with Google'),
                        ),
                        SizedBox(
                          height: 15,
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
    );
  }
}
