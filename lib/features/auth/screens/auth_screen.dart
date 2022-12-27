import 'package:auth_app/core/constant/text_field.dart';
import 'package:auth_app/core/enums.dart';
import 'package:auth_app/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/loader.dart';


class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthScreenState();
}
class _AuthScreenState extends ConsumerState<AuthScreen> {


  TextEditingController emailController=TextEditingController();
  TextEditingController passowrdController=TextEditingController();
  TextEditingController confirmPassowrdController=TextEditingController();
  
  AuthMode authMode=AuthMode.singIn;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  changeMode(){
    if(authMode==AuthMode.singIn){
      setState(() {
        authMode=AuthMode.singUp;
      });
    }else{
      setState(() {
        authMode=AuthMode.singIn;
      });
    }
  }
  @override
  void dispose() { 
    super.dispose();
    emailController.dispose();
    passowrdController.dispose();
    confirmPassowrdController.dispose();
  }

  signIn(){
    ref.read(authControllerProvider).singInWithFirebase(emailController.text.trim(), passowrdController.text.trim());
     setState(() {
       emailController.text="";
       passowrdController.text="";
     });
    }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      body:Center(
        child: Container(
            height: size.height * 0.5,
            margin: const EdgeInsets.all(14),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color:darkGreenColor,
              borderRadius: BorderRadius.circular(10),
            ),
              child: Form(
                key:_formKey,
                child: Column(
                  children: [
                    InputTextFiled(keytextFiled:const Key('input1'),controller: emailController, hintText: 'Enter Email'),
                    InputTextFiled(keytextFiled:const Key('input2'),controller: passowrdController, hintText: 'Password'),
                    if(authMode==AuthMode.singUp)InputTextFiled(keytextFiled:const Key('input3'),controller: confirmPassowrdController, hintText: 'Confirm Password'),
                    FutureBuilder(
                      builder:(context,snapshot){ 
                        if (snapshot.connectionState==ConnectionState.waiting){
                          return const Loader();
                        }
                        return ElevatedButton(
                        onPressed: signIn,
                        child: Text(
                          authMode==AuthMode.singIn?'SignIn':'SignUp'
                          )
                          );
               }),
                    TextButton(onPressed: changeMode, child: Text(authMode==AuthMode.singIn?'SignUp':'SignIn'))
                  ],
                ),
              ),
          ),
      ),
    );
  }
}