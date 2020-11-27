import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  AddItem(this.addNew);
  final Function addNew;

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final titleController = TextEditingController();
  final namaController = TextEditingController();
  final hargaController = TextEditingController();
  final qtyController = TextEditingController();

  void saveNewItem(){
    final title = titleController.text;
    final nama = namaController.text;
    final harga = hargaController.text;
    final qty = int.parse(qtyController.text);

    if (title.isEmpty || nama.isEmpty || harga.isEmpty || qty <= 0){
      return;
    }
    widget.addNew(title,nama,double.parse(harga),qty);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.black,
          title: Text("New Order", style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "Nama Barang"),
                  controller: titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Pembeli"),
                  controller: namaController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "harga"),
                  controller: hargaController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "jumlah"),
                  controller: qtyController,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    onPressed: saveNewItem,
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    color: Colors.black38,
                      child: Text('Tambah', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
