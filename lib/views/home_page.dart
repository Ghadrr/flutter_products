import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/services/request_http.dart';

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
                            Image.network(
                                "${snapshot.data[index]['images']}",
                                width: 100,
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
