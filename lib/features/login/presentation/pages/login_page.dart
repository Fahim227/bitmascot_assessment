import 'package:bitmascot_assessment/core/utils/app_colors.dart';
import 'package:bitmascot_assessment/core/widgets/common_button.dart';
import 'package:bitmascot_assessment/features/login/presentation/bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is LoginSuccessState) {
              // TODO: Navigate to list page
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Log in to WebCommander ",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "A complete eCommerce platform",
                style: Theme.of(context).textTheme.titleMedium,
              ),

              SizedBox(height: 32),

              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  hintText: 'Enter your email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              SizedBox(height: 16),

              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter password',
                ),
              ),
              SizedBox(height: 16),

              CommonButton(
                width: size.width,
                height: 44,
                borderColor: AppColors.borderColor,
                buttonColor: AppColors.borderColor,
                buttonContent: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  context.read<LoginCubit>().onLogin(
                    _emailController.text,
                    _passwordController.text,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
