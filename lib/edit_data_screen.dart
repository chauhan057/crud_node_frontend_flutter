import 'package:flutter/material.dart';
import 'package:node_tutorial/model/product_model.dart';
import 'package:node_tutorial/services/api.dart';

class EditScreen extends StatefulWidget {
  final Product data;
  const EditScreen({super.key, required this.data});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.data.name.toString();
    priceController.text = widget.data.price.toString();
    descController.text = widget.data.desc.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: "Name Here"),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(hintText: "Price Here"),
            ),
            TextField(
              controller: descController,
              decoration: InputDecoration(hintText: "Desc Here"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Api.updateProduct(widget.data.id, {
                    "pname": nameController.text,
                    "pdesc": descController.text,
                    "pprice": priceController.text,
                    'id': widget.data.id,
                  });
                },
                child: Text("Update Data"))
          ],
        ),
      ),
    );
  }
}
