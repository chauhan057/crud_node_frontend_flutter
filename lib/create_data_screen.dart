import 'package:flutter/material.dart';
import 'package:node_tutorial/services/api.dart';

class CreateDataScreen extends StatefulWidget {
  const CreateDataScreen({super.key});

  @override
  State<CreateDataScreen> createState() => _CreateDataScreenState();
}

class _CreateDataScreenState extends State<CreateDataScreen> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name Here"
              ),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                hintText: "Price Here"
              ),
            ),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                hintText: "Desc Here"
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              var data ={
                "pname":nameController.text,
                "pprice":priceController.text,
                "pdesc":descController.text,
              };
              Api.addProduct(data);

            }, child: Text("Create Data"))
          ],
        ),
      ),
    );
  }
}
