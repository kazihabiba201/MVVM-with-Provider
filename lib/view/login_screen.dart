import 'package:flutter/material.dart';
import 'package:mvvmpractice/utils/routes/routes_name.dart';
import 'package:mvvmpractice/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
               Utils.toastMessage('No Internet Connection');
              Utils.snakBar('no internet', context);
              Navigator.pushNamed(context, RoutesName.home);
            },
            child: const Text('fgfhg')),
      ),
    );
  }
}
