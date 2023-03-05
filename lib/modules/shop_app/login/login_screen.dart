import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:udemy/layout/shop_app/shop_layout.dart';
import 'package:udemy/modules/shop_app/login/cubit/cubit.dart';
import 'package:udemy/modules/shop_app/login/cubit/states.dart';
import 'package:udemy/modules/shop_app/register/register_screen.dart';
import 'package:udemy/shared/components/components.dart';
import 'package:udemy/shared/components/constants.dart';
import 'package:udemy/shared/network/local/cache_helper.dart';

class ShopLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ShopLoginCubit(),
        child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
          listener: (context, state) {
            if(state is ShopLoginSuccessStates){
              if(state.loginModel!.status! ){
                print(state.loginModel?.message);
                print(state.loginModel?.data?.token);
                showToast(
                    text: state.loginModel!.message!,
                    state:ToastStates.SUCCESS);

               CacheHelper.saveData(key: 'token',
                   value: state.loginModel?.data?.token
               ).then((value){
                token=state.loginModel!.data!.token!;
                 navigatorAndFinish(context, ShopLayout());
                   });

              }else{
               showToast(
                   text: state.loginModel!.message!,
                   state:ToastStates.ERROR
               );
              }
            }

          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("LOGIN",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                  )),
                          Text(
                            "login now to browse our hot offers",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          defaultTextField(
                              controller: emailController,
                              keyboard: TextInputType.emailAddress,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "please enter your email address";
                                }
                                return null;
                              },
                              label: "Email Address",
                              prefixicon: Icons.email_outlined),
                          SizedBox(
                            height: 20,
                          ),
                          defaultTextField(
                              controller: passwordController,
                              keyboard: TextInputType.visiblePassword,
                              suffixicon: ShopLoginCubit.get(context)?.suffix,
                              suffixpressed: () {
                                ShopLoginCubit.get(context)?.changeVisibility();
                              },
                              ispassword:
                                  ShopLoginCubit.get(context)!.isPassword,
                              onsubmit: (value) {
                                if (formKey.currentState!.validate()) {
                                  ShopLoginCubit.get(context)?.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "password is too short";
                                }
                                return null;
                              },
                              label: "Password",
                              prefixicon: Icons.lock),
                          SizedBox(
                            height: 20,
                          ),
                          ConditionalBuilder(
                            condition: state is! ShopLoginLoadingStates,
                            builder: (context) => defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  ShopLoginCubit.get(context)?.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              text: "LOGIN",
                            ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don\'t have an account?"),
                              defaultTextButton(
                                onPressed: () {
                                  navigatorTo(context, ShopRegisterScreen());
                                },
                                text: "Register",
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
