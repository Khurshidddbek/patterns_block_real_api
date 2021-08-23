import 'package:flutter/material.dart';
import 'package:patterns_block_real_api/model/contact_model.dart';
import 'package:patterns_block_real_api/views/item_of_post.dart';

Widget viewOfHome(List<Contact> items, bool isLoading) {
  return Stack(
    children: [
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return itemOfPosts(ctx, items[index]);
        },
      ),

      isLoading ? Center(child: CircularProgressIndicator(),) : SizedBox.shrink(),
    ],
  );
}