import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartModel {
  String img;
  String title;
  int size;
  Color col;
  String txtcol;
  double price;
  CartModel(
      {required this.img,
      required this.col,
      required this.size,
      required this.title,
      required this.price,
      required this.txtcol});
}

List<CartModel> cart = [
  CartModel(
      img:
          "https://freepngimg.com/thumb/chair/2-2-chair-download-png-thumb.png",
      col: Colors.black,
      size: 34,
      price: 200.0,
      title: "Chair side end Table",
      txtcol: "Black"),
  CartModel(
      img:
          "https://freepngimg.com/thumb/chair/2-2-chair-download-png-thumb.png",
      col: Colors.black,
      size: 34,
      price: 200.0,
      title: "Chair side end Table",
      txtcol: "Black"),
  CartModel(
      img:
          "https://freepngimg.com/thumb/chair/2-2-chair-download-png-thumb.png",
      col: Colors.yellow,
      size: 34,
      price: 200.0,
      title: "Chair side end Table",
      txtcol: "yellow"),
  CartModel(
      img:
          "https://freepngimg.com/thumb/chair/2-2-chair-download-png-thumb.png",
      col: Colors.black,
      size: 34,
      price: 200.0,
      title: "Chair side end Table",
      txtcol: "Black"),
  CartModel(
      img:
          "https://freepngimg.com/thumb/chair/2-2-chair-download-png-thumb.png",
      col: Colors.black,
      size: 34,
      price: 200.0,
      title: "Chair side end Table",
      txtcol: "Black"),
];
