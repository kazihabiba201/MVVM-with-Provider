import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvmpractice/repository/auth_repository.dart';
import 'package:mvvmpractice/utils/utils.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();

  Future<void>loginApi(dynamic data, BuildContext context) async{
 _myRepo.loginApi(data).then((value) {
   Utils.flushBarErrorMessage('Login SuccessFully', context);
   if(kDebugMode){
     print(value.toString());
   }

 }).onError((error, stackTrace) {
   Utils.flushBarErrorMessage(error.toString(), context);
   if(kDebugMode){
     print(error.toString());
   }
 });
}
}