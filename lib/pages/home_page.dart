import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kyou_app/components/text/product_card.dart';
import 'package:flutter_kyou_app/models/crud_model.dart';
import 'package:flutter_kyou_app/models/product.dart';
import 'package:flutter_kyou_app/services/base_auth.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> { List<Product> products;

@override
Widget build(BuildContext context) {
  final productProvider = Provider.of<CrudModel>(context);

  return Scaffold(
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/addProduct');
      },
      child: Icon(Icons.add),
    ),
    appBar: AppBar(
      title: Center(child: Text('Home')),
    ),
    body: Container(
      child: StreamBuilder(
          stream: productProvider.fetchProductsAsStream(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              products = snapshot.data.documents
                  .map((doc) => Product.fromMap(doc.data, doc.documentID))
                  .toList();
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (buildContext, index) =>
                    ProductCard(productDetails: products[index]),
              );
            } else {
              return Text('fetching');
            }
          }),
    ),
  );
}
}