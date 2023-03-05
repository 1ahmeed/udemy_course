import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/layout/shop_app/shop_layout.dart';
import 'package:udemy/modules/shop_app/login/cubit/cubit.dart';
import 'package:udemy/modules/shop_app/register/cubit/cubit.dart';
import 'package:udemy/modules/shop_app/register/cubit/states.dart';
import 'package:udemy/shared/components/components.dart';
import 'package:udemy/shared/components/constants.dart';
import 'package:udemy/shared/network/local/cache_helper.dart';

class ShopRegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit,ShopRegisterStates>(
        listener: (context, state) {
          if(state is ShopRegisterSuccessStates){
            if(state.loginModel!.status! ){
              print(state.loginModel?.message);
              print(state.loginModel?.data?.token);
              showToast(
                  text: state.loginModel!.message!,
                  state:ToastStates.SUCCESS);
              CacheHelper.saveData(key: 'token',
                  value: state.loginModel?.data?.token).then((value){
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
        builder:(context, state) {
          return Scaffold(
            body:  Center (
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("REGISTER",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          "Register now to browse our hot offers",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        defaultTextField(
                            controller: nameController,
                            keyboard: TextInputType.name,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "please enter your name";
                              }
                              return null;
                            },
                            label: "User Name",
                            prefixicon: Icons.person),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextField(
                            controller: emailController,
                            keyboard: TextInputType.emailAddress,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "please enter your email";
                              }
                              return null;
                            },
                            label: "Email",
                            prefixicon: Icons.email),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextField(
                            controller: phoneController,
                            keyboard: TextInputType.phone,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "please enter your phone";
                              }
                              return null;
                            },
                            label: "Phone",
                            prefixicon: Icons.phone),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextField(
                            controller: passwordController,
                            keyboard: TextInputType.visiblePassword,
                            suffixicon: ShopRegisterCubit.get(context)?.suffix,
                            suffixpressed: () {
                              ShopRegisterCubit.get(context)?.changeVisibility();
                            },
                            ispassword:
                            ShopRegisterCubit.get(context)!.isPassword,
                            onsubmit: (value) {


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
                          condition:  state is! ShopRegisterLoadingStates,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                ShopRegisterCubit.get(context)?.userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,


                                );
                              }
                            },
                            text: "REGISTER",
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } ,

      ),
    );
  }
}
