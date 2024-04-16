import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/request_http.dart';
import 'package:flutter_application_1/views/detail_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Chamar getProducts() aqui pode causar um loop infinito, certifique-se de chamá-lo apenas quando necessário.
    // getProducts();

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
              itemCount: snapshot.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailProduct(
                          title: snapshot.data[index]['title'],
                          image: snapshot.data[index]['images'][0],
                          price: 'Preço: R\$${snapshot.data[index]['price']}',
                          stock: 'Estoque: ${snapshot.data[index]['stock']}',
                          descricao: 'Descrição: ${snapshot.data[index]['description']}',
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                            child: Image.network(
                              "${snapshot.data[index]['images'][0]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data[index]['title']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Preço: R\$${snapshot.data[index]['price']}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
