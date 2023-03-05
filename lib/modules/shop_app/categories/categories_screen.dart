import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/layout/shop_app/cubit/cubit.dart';
import 'package:udemy/layout/shop_app/cubit/states.dart';
import 'package:udemy/models/shop_app/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          itemBuilder:(context, index) =>BuildCatItem(ShopCubit.get(context)!.categoriesModel.data.data[index]) ,
          separatorBuilder: (context, index) => SizedBox(width: 10,),
          itemCount: ShopCubit.get(context)!.categoriesModel.data.data.length,);
      } ,

    );
  }

  Widget BuildCatItem(DataModel model)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(image: NetworkImage(model.image),
          fit: BoxFit.cover,
          width: 80,
          height: 80,
        ),
        SizedBox(width: 10,),
        Text(model.name,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24),),
        Spacer(),
        Icon(Icons.arrow_forward_ios),
      ],
    ),
  ) ;
}
