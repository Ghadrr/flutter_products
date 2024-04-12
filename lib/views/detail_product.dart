import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/home_page.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
              
        
        },
        child: Text('Ir para Pagina incial'),
      ),
    );
  }
}
