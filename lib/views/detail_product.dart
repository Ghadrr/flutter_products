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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  widget.price,
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
                SizedBox(height: 8),
                Text(
                  widget.stock,
                  style: TextStyle(fontSize: 18, color: Colors.blue),),
                SizedBox(height: 16),
                Text("Descrição",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                ),
                SizedBox(height: 8),
                Text(widget.descricao,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
