import 'package:flutter/material.dart';
import 'package:mvvmpractice/utils/routes/routes_name.dart';
import 'package:mvvmpractice/view/home_screen.dart';
import 'package:mvvmpractice/view/login_screen.dart';

class Routes{
   static Route<dynamic> generateRoute(RouteSettings settings){
      final arguments = settings.arguments;
     switch(settings.name){
       case RoutesName.home:
         return MaterialPageRoute(builder:(BuildContext context)=> const HomeScreen());
       case RoutesName.login:
         return MaterialPageRoute(builder:(BuildContext context)=> const LoginScreen());

       default:
         return MaterialPageRoute(builder: (_){
           return const Scaffold(
             body: Center(
               child: Text('No route defined'),
             )
           );
         });
     }
   }
 }