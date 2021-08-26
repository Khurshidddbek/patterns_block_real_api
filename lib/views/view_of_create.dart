import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_block_real_api/blocs/create_page_cubit.dart';
import 'package:patterns_block_real_api/model/contact_model.dart';

Widget viewOfCreate(BuildContext context, TextEditingController titleController, TextEditingController bodyController, bool isLoading) {
  return Container(
    padding: EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                  hintText: "Phone number",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                Contact contact = Contact(username: titleController.text.toString(), phoneNumber: bodyController.text.toString());
                BlocProvider.of<CreatePageCubit>(context).apiContactCreate(contact);
              },
              color: Colors.blue,
              child: Text(
                "Create a contact",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),

        isLoading ? Center(
          child: CircularProgressIndicator(),
        ): SizedBox.shrink(),
      ],
    ),
  );
}