import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart.dart';

class ProductPage extends StatelessWidget {
  final List<Cart> carts;

  ProductPage(this.carts);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      child: carts.isEmpty ? Column(
        children: <Widget>[
          Text("Tidak Ada Order", style: Theme.of(context).textTheme.title,
          ),
        ],):
      ListView.builder(
          itemBuilder: (context, index){
          double total_harga = carts[index].harga * carts[index].qty;
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    carts[index].qty.toString(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(carts[index].nama,
                    style: TextStyle(
                      //color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                    Text('Barang: '+carts[index].title+'',
                      style: TextStyle(
                          //color: Colors.black,
                          fontSize: 15
                      ),),
                    Text('Harga: IDR, '+ carts[index].harga.toStringAsFixed(0),
                      style: TextStyle(
                          //color: Colors.black,
                          fontSize: 15
                      ),),
                    Text('Total: IDR, '+ total_harga.toStringAsFixed(0),
                      style: TextStyle(
                          //color: Colors.black,
                          fontSize: 15
                      ),),
                  ],
                )
              ],
            ),
          );
          },
          itemCount: carts.length,
      )
    );
  }
}
