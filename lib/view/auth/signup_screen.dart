import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/view_model/auth_view_model.dart';
import 'login_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../../constants.dart';
import '../widgets/custom_text_form.dart';

class SignupScreen extends GetWidget<AuthViewModel> {
  bool obscureText = true;
  String? name, email, password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.off(LoginScreen());
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Form(
            // autovalidateMode: AutovalidateMode.a,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CustomText(
                    text: "Sign Up",
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
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
                          return 'Please enter Name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        name = value;
                      },
                      labelText: "Full Name",
                    ),
                    CustomTextFormFiled(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter vaild Email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        email = value;
                      },
                      labelText: "Email",
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
                        password = value;
                      },
                      labelText: "Password",
                      obscureText: obscureText,
                      icon: IconButton(
                          color: primaryColor,
                          onPressed: () {
                            // setState(() {});
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
                            controller.createAccountWithEmailAndPassword(
                                name!, email!, password!);
                          }
                        },
                        text: 'Sign Up',
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
                            text: 'Already have an account ?',
                            color: Color(0xFF848484),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(LoginScreen());
                            },
                            child: const CustomText(
                              text: 'Sign In',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
