import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flavors/auth/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    NameFormField(textEditingController: _nameController),
                    const SizedBox(height: 10),
                    EmailFormField(textEditingController: _emailController),
                    const SizedBox(height: 10),
                    PasswordFormField(textEditingController: _passwordController),
                    const SizedBox(height: 10),
                    ConfirmPasswordFormField(
                      confirmPassword_TextEditingController: _confirmPasswordController,
                      password_TextEditingController: _passwordController,
                    ),
                    const SizedBox(height: 10),
                    RegisterButton(
                        formKey: _formKey,
                        nameController: _nameController,
                        emailController: _emailController,
                        passwordController: _passwordController),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
