import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class InfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        //backgroundColor: Colors.black26,
        appBar: AppBar(
          title: Text('About'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          //backgroundColor: Colors.red[800],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              PicApp(),
              AboutName(),
              TextDesc(),
              TextEmail(),
            ],
          ),
        ),
      ),
    );
  }
}

class PicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        image: DecorationImage(
          image: AssetImage("images/logo.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      margin: const EdgeInsets.only(top: 30.0),
    );
  }
}

class AboutName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'PP STORE',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
      margin: const EdgeInsets.only(top: 50.0),
    );
  }
}

class TextDesc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Aplikasi yang dapat digunakan dalam melakukan penginputan data pembeli dan menampilkannya, '
            'Aplikasi ini dibuat oleh I Kadek Permana Putra',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,

        ),
      ),
      margin: const EdgeInsets.only(left: 40, top: 10.0, right: 40.0)
    );
  }
}

class TextEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'ikdkpermana@gmail.com',
        style: TextStyle(
          color: Colors.lightBlue,
          fontSize: 15,
        ),
      ),
      margin: const EdgeInsets.only(top: 30.0),
    );
  }
}
