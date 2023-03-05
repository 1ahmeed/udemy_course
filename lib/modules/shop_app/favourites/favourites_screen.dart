import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/layout/shop_app/cubit/cubit.dart';
import 'package:udemy/layout/shop_app/cubit/states.dart';
import 'package:udemy/models/shop_app/favourites_model.dart';
import 'package:udemy/shared/components/components.dart';
import 'package:udemy/shared/styles/colors.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition:State is !ShopLoadingGetFavouritesStates ,
          builder:(context) => ListView.separated(
            itemBuilder:(context, index) =>buildProductItems(
                ShopCubit.get(context)!.favouritesModel!.data!.data![index].product!,context
            ),
            separatorBuilder: (context, index) => SizedBox(width: 10,),
            itemCount:ShopCubit.get(context)!.favouritesModel!.data!.data!.length,),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      } ,

    );

  }

}

/*
Widget buildFavItem( model,context)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      width: double.infinity,
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image(image: NetworkImage(model.image.toString()),
                width: 120,
                height: 120,


              ),
              if(model.discount != 0)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.red,
                  child: Text("DISCOUNT",
                    style: TextStyle(color: Colors.white,
                        fontSize: 14
                    ),),
                )
            ],
          ),
          SizedBox(width:5 ,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      model.price.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold,
                          color: defaultColor),

                    ),
                    SizedBox(width: 5,),
                    if(model.discount.toString() != 0)
                      Text(
                        model.oldPrice.toString(),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),


                      ),
                    Spacer(),
                    IconButton(
                      icon:  CircleAvatar(
                          radius: 17,
                          backgroundColor:
                          ShopCubit.get(context)!.favourites[model.id]! ?defaultColor:Colors.grey,
                          child: Icon(Icons.favorite_border,
                            size: 17,
                            color: Colors.white,
                          )),
                      onPressed: (){
                        //print(model.id);
                       ShopCubit.get(context)!. changeFavourites(model.id!);
                      },
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
 */