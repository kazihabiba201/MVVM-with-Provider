import 'package:flutter/material.dart';
import 'package:mvvmpractice/res/components/round_button.dart';
import 'package:mvvmpractice/utils/utils.dart';
import 'package:mvvmpractice/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  FocusNode emailFocusedNode = FocusNode();
  FocusNode passwordFocusedNode = FocusNode();

  final ValueNotifier<bool> _obSecurePassword = ValueNotifier<bool>(true);

  @override
  void dispose(){
    super.dispose();

 _emailController.dispose();
 _passController.dispose();
 emailFocusedNode.dispose();
 passwordFocusedNode.dispose();
 _obSecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailFocusedNode,
                  decoration: const InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.alternate_email)),
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context, emailFocusedNode, passwordFocusedNode);
                  },
                ),
                ValueListenableBuilder(
                    valueListenable: _obSecurePassword,
                    builder: (context, value, child) {
                      return TextFormField(
                        controller: _passController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        obscuringCharacter: "*",
                        focusNode: passwordFocusedNode,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: Icon(Icons.visibility_off_outlined),
                        ),
                      );
                    }),
                SizedBox(
                  height: height * .1,
                ),
                RoundButton(title: 'Login', onPress: (){

                    if(_emailController.text.isEmpty){
                    Utils.flushBarErrorMessage('Please enter email', context);
                    }
                    // else if(_passController.text.isEmpty){
                    // Utils.flushBarErrorMessage('Please enter valid email', context);
                    // }
                    else if(_passController.text.isEmpty){
                    Utils.flushBarErrorMessage('Please enter password', context);
                    }else if(_passController.text.length < 6){
                    Utils.flushBarErrorMessage('Please enter 6 digit password', context);
                    }else {
                      Map data = {
                       'email': _emailController.text.toString(),
                       'password': _passController.text.toString(),
                      };
                      authViewModel.loginApi(data, context);
                      print('hit');}
    }),
              ],
            ),
          ),
        ));
  }
}
