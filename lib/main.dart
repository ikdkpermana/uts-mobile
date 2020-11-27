import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'add_page.dart';
import 'home_page.dart';
import 'product_page.dart';
import 'about.dart';
import 'cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PP STORE",
      theme: ThemeData.dark(),
      home: Home(),
      routes: <String, WidgetBuilder>{
        'page1' : (BuildContext context) => new Home(),
        'page2' : (BuildContext context) => new InfoApp(),
      }
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Cart> _carts = [];
  void _openModal(BuildContext context){
    showCupertinoModalPopup(
        context: context,
        builder: (_){
          return AddItem(_addNewItem);
        }
    );
  }

  void _addNewItem(String title, String nama, double harga, int qty){
    final newItem = Cart(id: DateTime.now().toString(), title: title, nama: nama, harga: harga, qty: qty);
    setState(() {
      _carts.add(newItem);
    });
  }

  void _resetCarts(){
      setState(() {
        _carts.clear();
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.black38,
          onPressed: () => _openModal(context)
      ),

      appBar: AppBar(
        leading: new IconButton(
            icon: Icon(Icons.info_outline, color: Colors.white,),

            onPressed: (){
              Navigator.pushNamed(context, 'page2');
            }
        ),
        title: Text("PP STORE"),
        actions: <Widget>[
          FlatButton(child: Icon(Icons.delete_outline, color: Colors.white,),
              onPressed: () => _resetCarts(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HomePage(_carts),
            ProductPage(_carts),
          ],
        ),
      ),
    );
  }
}




