import 'package:flutter/material.dart';
import 'package:flutter_kyou_app/pages/product_pages/add_product.dart';
import 'package:flutter_kyou_app/pages/product_pages/product_detail.dart';
import 'package:flutter_kyou_app/pages/root_page.dart';
import 'package:flutter_kyou_app/services/authentication.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => RootPage(auth: new Auth()));
        break;
      case '/addProduct' :
        return MaterialPageRoute(
            builder: (_)=> AddProduct()
        ) ;
        break;
      case '/productDetails' :
        return MaterialPageRoute(
            builder: (_)=> ProductDetails()
        ) ;
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}