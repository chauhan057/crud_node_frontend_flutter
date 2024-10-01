import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:node_tutorial/create_data_screen.dart';
import 'package:node_tutorial/edit_data_screen.dart';
import 'package:node_tutorial/fetch_data_screen.dart';
import 'package:node_tutorial/services/delete_data_screen.dart';
import 'package:node_tutorial/update_data_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Get.to(CreateDataScreen());
          }, child: Text("CREATE")),
          ElevatedButton(onPressed: (){
            Get.to(FetchScreen());
          }, child: Text("READ")),
          ElevatedButton(onPressed: (){
            Get.to(UpdateScreen());
          }, child: Text("UPDATE")),
          ElevatedButton(onPressed: (){
            Get.to(DeleteScreen());
          }  , child: Text("DELETE")),
        ],
      ),
    );
  }
}
