import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:node_tutorial/edit_data_screen.dart';
import 'package:node_tutorial/model/product_model.dart';
import 'package:node_tutorial/services/api.dart';
import 'package:get/get.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
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
                          onPressed: (){
                            Get.to(EditScreen(data: pData[index],));
                          },
                          icon: Icon(Icons.edit),
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