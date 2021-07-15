import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_managment/homework/MyProvider.dart';
import 'package:state_managment/homework/product_model.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  int id;
  ProductWidget(this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Stack(
        children: [
          Container(
            height: 200,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Image.network(
              Provider.of<MyProvider>(context).data.where((element) => element.id == this.id).first.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 180,
            margin: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Provider.of<MyProvider>(context, listen: false).addToFav(Provider.of<MyProvider>(context).data.where((element) => element.id == this.id).first);
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.3),
                      radius: 30,
                      child: Icon(
                        Icons.favorite,
                        size: 40,
                        color: Provider.of<MyProvider>(context).data.where((element) => element.id == this.id).first.isFav ? Colors.red : Colors.white,
                      )),
                ),
                Container(
                  color: Colors.white.withOpacity(0.4),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                      Provider.of<MyProvider>(context).data.where((element) => element.id == this.id).first.name,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
