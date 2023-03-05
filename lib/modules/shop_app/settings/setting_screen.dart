import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/layout/shop_app/cubit/cubit.dart';
import 'package:udemy/layout/shop_app/cubit/states.dart';
import 'package:udemy/shared/components/components.dart';
import 'package:udemy/shared/components/constants.dart';
import 'package:udemy/shared/styles/colors.dart';

class SettingScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var model = ShopCubit.get(context)?.userModel;
        if(model != null) {
          nameController.text = model.data!.name!;
          emailController.text = model.data!.email!;
          phoneController.text = model.data!.phone!;
        }

        return ConditionalBuilder(
          condition: ShopCubit
              .get(context)
              ?.userModel != null,
          builder: (context) =>
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          Container(
                            child: TextButton(
                              onPressed: () {
                                signout(context);
                              },
                              child: Text('SignOut',
                                style: TextStyle(fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: defaultColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultTextField(
                        controller: nameController,
                        keyboard: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Name Must Not Be Empty ';
                          }
                        },
                        label: 'Name',
                        prefixicon: Icons.person,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultTextField(
                        controller: emailController,
                        keyboard: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Email Must Not Be Empty ';
                          }
                        },
                        label: 'EmailAddress',
                        prefixicon: Icons.email,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultTextField(
                        controller: phoneController,
                        keyboard: TextInputType.phone,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Phone Must Not Be Empty ';
                          }
                        },
                        label: 'Phone Number',
                        prefixicon: Icons.phone,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultButton(
                          function: () {
                           //  if(formKey.currentState!.validate()){
                           //    if(state is ShopSuccessUpdateUserStates){
                           //      ShopCubit.get(context)?.updateUserData(
                           //          name: nameController.text,
                           //          email: emailController.text,
                           //          phone: phoneController.text);
                           //      showToast(text: 'updated success',
                           //          state: ToastStates.SUCCESS);
                           //
                           //    }
                           //    else{
                           //     print(model.status);
                           //     print(model.message);
                           //     print(model.data!.name);
                           //     print(model.data!.token);
                           //
                           //    }
                           // }
                        if(formKey.currentState!.validate())
                            {
                           ShopCubit.get(context)?.updateUserData(
                              name: nameController.text,
                               phone: phoneController.text,
                               email: emailController.text,);
                           showToast(text: 'updated success',
                                        state: ToastStates.SUCCESS);
                                 //print(nameController.text+' new one');
                                    }


                          },
                          text: 'UPDATE')
                    ],
                  ),
                ),
              ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
