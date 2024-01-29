import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';
import './../../common/common.dart';
import './../../services/services.dart';

enum Auth { signIn, signUp }

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  static const String routeName = "/auth-route";

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  Auth _auth = Auth.signUp;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _keySignInForm = GlobalKey<FormState>();
  final _keySignUpForm = GlobalKey<FormState>();
  final AuthService authService = new AuthService();

  @override

  void dispose() {

    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
  void signUp(){
      authService.signUp(name: _nameController.text, email:_emailController.text, password:_passwordController.text, context: context);
  }
  void signIn(){
      authService.signIn( email:_emailController.text, password:_passwordController.text, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
                  ListTile(
                      tileColor:_auth==Auth.signUp?AppColor.backgroundColor:AppColor.greyBackgroundCOlor,
                      title: const Text(
                        "Create Account",
                        style: TextStyle(
                           fontWeight: FontWeight.bold
                        ),
                      ),
                      leading: Radio(
                        value: Auth.signUp,
                        groupValue: _auth,
                        onChanged: (value) => {setState(() => _auth = value!)},
                      )),
                  if (_auth == Auth.signUp)
                    Form(
                        key: _keySignUpForm,
                        child: Container(
                          color:AppColor.backgroundColor,
                          padding:const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(height:5,),
                              CustomTextField(
                                controller: _nameController,
                                placeHolder: "name",
                              ),   
                              const SizedBox(height:10,),
                              CustomTextField(
                                  controller: _emailController,
                                  placeHolder: "email"
                              ),
                              const SizedBox(height:10,),
                              CustomTextField(
                                controller: _passwordController,
                                placeHolder: "password",
                              ),
                              const SizedBox(height:10,),
                              CustomButton(btnText: "Sign Up",onTap: (){
                                  if(_keySignUpForm.currentState!.validate()){
                                      signUp();
                                  }
                              },)
                            ],
                          ),
                        )),
                  ListTile(
                      tileColor:_auth==Auth.signIn?AppColor.backgroundColor:AppColor.greyBackgroundCOlor,
                      title: const Text(
                        "Sign In",
                        style: TextStyle(
                           fontWeight: FontWeight.bold
                        ),
                      ),
                      leading: Radio(
                        value: Auth.signIn,
                        groupValue: _auth,
                        onChanged: (value) => {setState(() => _auth = value!)},
                      )),
                      if (_auth == Auth.signIn)
                    Form(
                        key: _keySignInForm,
                        child: Container(
                          padding:const EdgeInsets.all(10),
                          color:AppColor.backgroundColor,
                          child: Column(
                            children: [
                              // const SizedBox(height:5,),
                              CustomTextField(
                                  controller: _emailController,
                                  placeHolder: "email"
                              ),
                              const SizedBox(height:10,),
                              CustomTextField(
                                controller: _passwordController,
                                placeHolder: "password",
                              ),
                              const SizedBox(height:10,),
                              CustomButton(btnText: "Sign In",onTap: (){
                                  if(_keySignInForm.currentState!.validate()){
                                       signIn();
                                  }
                              },)
                            ],
                          ),
                        )
            ),
          ],
        ),
      )),
    );
  }
}
