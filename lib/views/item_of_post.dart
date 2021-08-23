import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patterns_block_real_api/blocs/list_post_cubit.dart';
import 'package:patterns_block_real_api/model/contact_model.dart';

Widget itemOfPosts(BuildContext context, Contact contact) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.25,
    child: Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Username
          Text(contact.username.toUpperCase(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),),

          SizedBox(height: 5,),

          // Phone number
          Text(contact.phoneNumber ?? 'a', style: TextStyle(color: Colors.black, fontSize: 22),),
        ],
      ),
    ),

    secondaryActions: [
      IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () {
          BlocProvider.of<ListPostCubit>(context).apiPostDelete(contact);
        },
      )
    ],
  );
}