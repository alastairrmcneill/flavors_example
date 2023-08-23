import 'package:flavors/general/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flavors/auth/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const SizedBox(height: 10),
              Text(
                'Please enter your details',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 5),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    EmailFormField(textEditingController: _emailController),
                    const SizedBox(height: 10),
                    PasswordFormField(textEditingController: _passwordController),
                  ],
                ),
              ),
              const ForgotPasswordButton(),
              SignInButton(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
              ),
              const SizedBox(height: 30),
              const TextDivider(text: 'Or continue with'),
              const SizedBox(height: 30),
              const RegisterNowButton(),
            ],
          ),
        ),
      ),
    );
  }
}
