import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../themes/styles.dart';
import 'sign_up.dart';
import '../services/auth_services.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Provider.of<AuthProvider>(context, listen: false).getCheck();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _emailController.text =
        Provider.of<AuthProvider>(context, listen: false).name ?? '';
    _passwordController.text =
        Provider.of<AuthProvider>(context, listen: false).password ?? '';
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('signin build');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 33,
                  right: 33,
                  top: 20,
                  bottom: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 32,
                      ),
                      child: Text(
                        'LMS',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Text(
                      'Take the world\'s best courses online from top university',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 80),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill email or username';
                        }
                        return null;
                      },
                      controller: _emailController,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      decoration:
                          const InputDecoration(hintText: 'Email or Username'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill your password';
                        }
                        return null;
                      },
                      controller: _passwordController,
                      autocorrect: false,
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(hintText: 'Password'),
                    ),
                    const SizedBox(height: 16),
                    Consumer<AuthProvider>(
                      builder: (context, provider, child) {
                        return GestureDetector(
                          onTap: () {
                            provider.toggleCheckBox();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15,
                                child: Checkbox(
                                  value: provider.checkBox,
                                  onChanged: (value) {
                                    provider.toggleCheckBox();
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Remember me',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17,
                                      letterSpacing: -0.41,
                                      color: Colors.black,
                                    ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Consumer<AuthProvider>(
                      builder: (context, provider, child) {
                        return ElevatedButton(
                            onPressed: provider.isLoading
                                ? null
                                : () => provider.signIn(context, _formKey,
                                    _emailController, _passwordController),
                            child: provider.isLoading
                                ? const Center(
                                    child: SizedBox(
                                        width: 28,
                                        height: 28,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        )))
                                : Text(
                                    'Sign In',
                                    style: btnTextStyle(context),
                                  ));
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
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
                                        const SignUpScreen()));
                          },
                          child: Text(
                            'Sign Up',
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
                    ),
                  ],
                ),
              ),
            ),

            /* forgot pw */
            const Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: Text(
                'Forget Password?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
