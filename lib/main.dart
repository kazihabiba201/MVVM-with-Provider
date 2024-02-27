import 'package:flutter/material.dart';
import 'package:mvvmpractice/utils/routes/routes.dart';
import 'package:mvvmpractice/utils/routes/routes_name.dart';
import 'package:mvvmpractice/view/login_screen.dart';
import 'package:mvvmpractice/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> AuthViewModel())
    ], child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    ),);
  }
}


