import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/request_http.dart';
import 'package:flutter_application_1/views/detail_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    getProducts();

    return Scaffold(
        appBar: AppBar(
          title: Text('Produtos'),
        ),
        body: FutureBuilder(
          future: getProducts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                  itemCount: 12,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        color: Colors.amber,
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailProduct(title: snapshot.data[index]['title'], 
                                        image: snapshot.data[index]['images'][0], 
                                        price: 'Preço: R\$${snapshot.data[index]['price']}',
                                        stock: 'Estoque: ${ snapshot.data[index]['stock']}',
                                        descricao: 'Descrição: ${ snapshot.data[index]['description']}'
                                        
                                        
                                        )));
                              },
                              child: null,
                            ),
                            Image.network(
                                "${snapshot.data[index]['images'][0]}",
                                width: 300,
                                height: 100,
                                fit: BoxFit.cover),
                            SizedBox(
                              height: 8,
                            ),
                            Text("${snapshot.data[index]['title']}"),
                            SizedBox(
                              height: 8,
                            ),
                            Text("${snapshot.data[index]['price']}"),
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
        ));
  }
}
