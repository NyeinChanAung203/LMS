import 'dart:developer';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../services/auth_services.dart';
import 'sign_in.dart';
import 'package:flutter/material.dart';
import '../themes/styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /* controllers */
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  void dispose() {
    /* controller dispose */
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('signup build');
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 33,
                    right: 33,
                    top: 20,
                    bottom: 20,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 32),
                            child: Text('LMS',
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                          ),
                          Text('Create Account',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge),
                          Text('We are excited to have you on board',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(
                            height: 80,
                          ),
                          /* Full Name */
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please fill your full name';
                              }
                              return null;
                            },
                            controller: _nameController,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            autocorrect: false,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              hintText: 'Full Name',
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please fill your email address';
                              } else if (!value.contains('@')) {
                                return 'Invalid email address';
                              }
                              return null;
                            },
                            controller: _emailController,
                            textInputAction: TextInputAction.next,
                            autocorrect: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please fill your password';
                              } else if (value.length < 8) {
                                return 'Password must be at least 8 characters';
                              }
                              return null;
                            },
                            controller: _passwordController,
                            textInputAction: TextInputAction.next,
                            obscureText: true,
                            autocorrect: false,
                            decoration: const InputDecoration(
                              hintText: 'Create Password',
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value != _passwordController.text) {
                                return 'Password does not match !';
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _confirmController,
                            textInputAction: TextInputAction.done,
                            onEditingComplete: () => authProvider.signUp(
                                context,
                                _formKey,
                                _nameController,
                                _emailController,
                                _passwordController),
                            obscureText: true,
                            autocorrect: false,
                            decoration: const InputDecoration(
                              hintText: 'Confirm Password',
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Consumer<AuthProvider>(
                            builder: (context, provider, child) {
                              return ElevatedButton(
                                onPressed: provider.isLoading
                                    ? null
                                    : () => provider.signUp(
                                        context,
                                        _formKey,
                                        _nameController,
                                        _emailController,
                                        _passwordController),
                                child: provider.isLoading
                                    ? const Center(
                                        child: SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : Text(
                                        'Sign Up',
                                        style: btnTextStyle(context),
                                      ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                      letterSpacing: -0.41,
                                    ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignInScreen()));
                                },
                                child: Text(
                                  'Sign In',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17,
                                        letterSpacing: -0.41,
                                      ),
                                ),
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
