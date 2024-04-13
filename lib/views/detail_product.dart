import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/home_page.dart';

class DetailProduct extends StatefulWidget {
  String title;
  String image;
  String price;
  String stock;
  String descricao;

  DetailProduct({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.stock,
    required this.descricao,
  });

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          Image.network(widget.image),
          Text(widget.title),
          Text(widget.price),
          Text(widget.stock),
          Text(widget.descricao),
        ]),
      ),
    );
  }
}
