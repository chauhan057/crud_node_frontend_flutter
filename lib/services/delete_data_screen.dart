import 'package:flutter/material.dart';

import '../edit_data_screen.dart';
import '../model/product_model.dart';
import 'package:get/get.dart';

import 'api.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: Api.getProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else{
              List<Product> pData = snapshot.data;
              return ListView.builder(
                  itemCount: pData.length,
                  itemBuilder: (BuildContext context,int index){
                    return Container(
                      padding: EdgeInsets.only(top: 3),
                      margin: EdgeInsets.only(top: 3),
                      color: Colors.red,
                      child: ListTile(
                        leading: const Icon(Icons.storage),
                        title: Text("${pData[index].name}"),
                        subtitle: Text("${pData[index].desc}"),
                        // trailing: Text("${pData[index].price}"),
                        trailing: IconButton(
                          onPressed: () async{
                            await  Api.deleteProduct(pData[index].id);
                            pData.removeAt(index);
                            setState(()  {
                            });
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    );
                  }
              );
            }
          }
      ),
    );
  }
}
